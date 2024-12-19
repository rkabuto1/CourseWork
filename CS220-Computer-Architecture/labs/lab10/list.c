#include "list.h"
#include <stddef.h> // for NULL
#include <stdlib.h> // for malloc
#include <stdio.h> // for printf
#include <assert.h> // for assert

list list_create() {
	list lst=malloc(sizeof(node));
	(*lst)=NULL;
	return lst;
}

void list_insertStart(list lst, node insert) {
	assert(list_valid(lst)); // Make sure there is no endless loop
	assert(node_getNext(insert)==NULL);  // Make sure that the insert node is a single node
	node_setNext(insert,*lst); // Make the next pointer of insert the old head of the list
	(*lst)=insert; // Make the insert node the new head of the list
}

void list_insertEnd(list lst,node insert) {
	assert(list_valid(lst)); // Make sure there is no endless loop
	if ((*lst)==NULL) {
		// Special case for null lists
		(*lst)=insert;
		return;
	}
	node tail=list_getTail(lst); // Find the tail of the list
	assert(node_getNext(insert)==NULL); // Ensure you are only adding one node to the list
	node_setNext(tail,insert); // Add the current node at the tail
}



void list_insertOrder(list lst,node insert) {
	assert(list_valid(lst)); // Make sure there is no endless loop
	assert(node_getNext(insert)==NULL);  // Make sure that the insert node is a single node
	if ((*lst)==NULL) { // Special case for null lists
		(*lst)=insert;
		return;
	}
	node tnode=(*lst); // Get the head of the list
	if (node_getPayload(insert) < node_getPayload(tnode)) { // Special case - insert at head
		list_insertStart(lst,insert);
		return;
	}
	while(node_hasNext(tnode) &&
				(node_getPayload(insert) >= node_getPayload(node_getNext(tnode)))
			  )
					tnode=node_getNext(tnode);
	if (node_hasNext(tnode)) {
		// Insert between tnode and next of tnode
		node afterT=node_getNext(tnode);
		node_setNext(insert,afterT);
	}
	node_setNext(tnode,insert);
}

node list_getTail(list lst) {
	assert(list_valid(lst)); // Ensure no endless loop
	if ((*lst)==NULL) return NULL; // Null list has no tail
	node nde=(*lst);
	while(node_hasNext(nde)) {
		nde=node_getNext(nde);
	}
	return nde;
}

int list_size(list lst) {
	if ((*lst)==NULL) return 0; // Nothing in the list
	int size=1; // at least one node
	node nde=(*lst);
	while(node_hasNext(nde)) {
		size++;
		nde=node_getNext(nde);
		assert(size<1000); // In case there is an endless loop
	}
	return size;
}

bool list_valid(list lst) {
	node *visited=malloc(sizeof(node)*list_size(lst));
	int n=0;
	node nde=(*lst);
	while(nde!=NULL) {
		for(int i=0;i<n;i++) {
			if (visited[i]==nde) {
				free(visited);
				return false; // already visited this node!
			}
		}
		visited[n++]=nde;
		nde=node_getNext(nde);
	}
	free(visited);
	return true;
}

void list_print(char *prefix,list lst) {
	assert(list_valid(lst)); // Ensure no endless loop
	if ((*lst)==NULL) printf("%s<empty>\n",prefix);
	else {
		node nde=*lst;
		printf("%s",prefix);
		while(node_hasNext(nde)) {
			node_print(nde);
			nde=node_getNext(nde);
		}
		node_print(nde);
		putchar('\n');
	}
}

void list_free(list lst) {
	if (*lst) node_free(*lst); // Only free the nodes if the list is not empty
	free(lst);
}