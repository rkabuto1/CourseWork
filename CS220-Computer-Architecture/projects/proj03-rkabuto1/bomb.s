
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 4f 00 00 	mov    0x4fc5(%rip),%rax        # 5fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <getenv@plt-0x10>:
    1020:	ff 35 ca 4f 00 00    	push   0x4fca(%rip)        # 5ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 4f 00 00    	jmp    *0x4fcc(%rip)        # 5ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <getenv@plt>:
    1030:	ff 25 ca 4f 00 00    	jmp    *0x4fca(%rip)        # 6000 <getenv@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <__errno_location@plt>:
    1040:	ff 25 c2 4f 00 00    	jmp    *0x4fc2(%rip)        # 6008 <__errno_location@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <strcpy@plt>:
    1050:	ff 25 ba 4f 00 00    	jmp    *0x4fba(%rip)        # 6010 <strcpy@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <puts@plt>:
    1060:	ff 25 b2 4f 00 00    	jmp    *0x4fb2(%rip)        # 6018 <puts@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <write@plt>:
    1070:	ff 25 aa 4f 00 00    	jmp    *0x4faa(%rip)        # 6020 <write@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001080 <strlen@plt>:
    1080:	ff 25 a2 4f 00 00    	jmp    *0x4fa2(%rip)        # 6028 <strlen@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001090 <htons@plt>:
    1090:	ff 25 9a 4f 00 00    	jmp    *0x4f9a(%rip)        # 6030 <htons@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010a0 <printf@plt>:
    10a0:	ff 25 92 4f 00 00    	jmp    *0x4f92(%rip)        # 6038 <printf@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	push   $0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010b0 <alarm@plt>:
    10b0:	ff 25 8a 4f 00 00    	jmp    *0x4f8a(%rip)        # 6040 <alarm@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	push   $0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010c0 <close@plt>:
    10c0:	ff 25 82 4f 00 00    	jmp    *0x4f82(%rip)        # 6048 <close@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	push   $0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010d0 <read@plt>:
    10d0:	ff 25 7a 4f 00 00    	jmp    *0x4f7a(%rip)        # 6050 <read@GLIBC_2.2.5>
    10d6:	68 0a 00 00 00       	push   $0xa
    10db:	e9 40 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010e0 <fgets@plt>:
    10e0:	ff 25 72 4f 00 00    	jmp    *0x4f72(%rip)        # 6058 <fgets@GLIBC_2.2.5>
    10e6:	68 0b 00 00 00       	push   $0xb
    10eb:	e9 30 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010f0 <strcmp@plt>:
    10f0:	ff 25 6a 4f 00 00    	jmp    *0x4f6a(%rip)        # 6060 <strcmp@GLIBC_2.2.5>
    10f6:	68 0c 00 00 00       	push   $0xc
    10fb:	e9 20 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001100 <signal@plt>:
    1100:	ff 25 62 4f 00 00    	jmp    *0x4f62(%rip)        # 6068 <signal@GLIBC_2.2.5>
    1106:	68 0d 00 00 00       	push   $0xd
    110b:	e9 10 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001110 <gethostbyname@plt>:
    1110:	ff 25 5a 4f 00 00    	jmp    *0x4f5a(%rip)        # 6070 <gethostbyname@GLIBC_2.2.5>
    1116:	68 0e 00 00 00       	push   $0xe
    111b:	e9 00 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001120 <fprintf@plt>:
    1120:	ff 25 52 4f 00 00    	jmp    *0x4f52(%rip)        # 6078 <fprintf@GLIBC_2.2.5>
    1126:	68 0f 00 00 00       	push   $0xf
    112b:	e9 f0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001130 <memcpy@plt>:
    1130:	ff 25 4a 4f 00 00    	jmp    *0x4f4a(%rip)        # 6080 <memcpy@GLIBC_2.14>
    1136:	68 10 00 00 00       	push   $0x10
    113b:	e9 e0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001140 <fflush@plt>:
    1140:	ff 25 42 4f 00 00    	jmp    *0x4f42(%rip)        # 6088 <fflush@GLIBC_2.2.5>
    1146:	68 11 00 00 00       	push   $0x11
    114b:	e9 d0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001150 <__isoc99_sscanf@plt>:
    1150:	ff 25 3a 4f 00 00    	jmp    *0x4f3a(%rip)        # 6090 <__isoc99_sscanf@GLIBC_2.7>
    1156:	68 12 00 00 00       	push   $0x12
    115b:	e9 c0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001160 <memmove@plt>:
    1160:	ff 25 32 4f 00 00    	jmp    *0x4f32(%rip)        # 6098 <memmove@GLIBC_2.2.5>
    1166:	68 13 00 00 00       	push   $0x13
    116b:	e9 b0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001170 <fopen@plt>:
    1170:	ff 25 2a 4f 00 00    	jmp    *0x4f2a(%rip)        # 60a0 <fopen@GLIBC_2.2.5>
    1176:	68 14 00 00 00       	push   $0x14
    117b:	e9 a0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001180 <sprintf@plt>:
    1180:	ff 25 22 4f 00 00    	jmp    *0x4f22(%rip)        # 60a8 <sprintf@GLIBC_2.2.5>
    1186:	68 15 00 00 00       	push   $0x15
    118b:	e9 90 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001190 <exit@plt>:
    1190:	ff 25 1a 4f 00 00    	jmp    *0x4f1a(%rip)        # 60b0 <exit@GLIBC_2.2.5>
    1196:	68 16 00 00 00       	push   $0x16
    119b:	e9 80 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011a0 <connect@plt>:
    11a0:	ff 25 12 4f 00 00    	jmp    *0x4f12(%rip)        # 60b8 <connect@GLIBC_2.2.5>
    11a6:	68 17 00 00 00       	push   $0x17
    11ab:	e9 70 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011b0 <sleep@plt>:
    11b0:	ff 25 0a 4f 00 00    	jmp    *0x4f0a(%rip)        # 60c0 <sleep@GLIBC_2.2.5>
    11b6:	68 18 00 00 00       	push   $0x18
    11bb:	e9 60 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011c0 <__ctype_b_loc@plt>:
    11c0:	ff 25 02 4f 00 00    	jmp    *0x4f02(%rip)        # 60c8 <__ctype_b_loc@GLIBC_2.3>
    11c6:	68 19 00 00 00       	push   $0x19
    11cb:	e9 50 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011d0 <socket@plt>:
    11d0:	ff 25 fa 4e 00 00    	jmp    *0x4efa(%rip)        # 60d0 <socket@GLIBC_2.2.5>
    11d6:	68 1a 00 00 00       	push   $0x1a
    11db:	e9 40 fe ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00000000000011e0 <__cxa_finalize@plt>:
    11e0:	ff 25 fa 4d 00 00    	jmp    *0x4dfa(%rip)        # 5fe0 <__cxa_finalize@GLIBC_2.2.5>
    11e6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000011f0 <_start>:
    11f0:	31 ed                	xor    %ebp,%ebp
    11f2:	49 89 d1             	mov    %rdx,%r9
    11f5:	5e                   	pop    %rsi
    11f6:	48 89 e2             	mov    %rsp,%rdx
    11f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    11fd:	50                   	push   %rax
    11fe:	54                   	push   %rsp
    11ff:	45 31 c0             	xor    %r8d,%r8d
    1202:	31 c9                	xor    %ecx,%ecx
    1204:	48 8d 3d ce 00 00 00 	lea    0xce(%rip),%rdi        # 12d9 <main>
    120b:	ff 15 af 4d 00 00    	call   *0x4daf(%rip)        # 5fc0 <__libc_start_main@GLIBC_2.34>
    1211:	f4                   	hlt
    1212:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1219:	00 00 00 
    121c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001220 <deregister_tm_clones>:
    1220:	48 8d 3d 39 54 00 00 	lea    0x5439(%rip),%rdi        # 6660 <stdout@GLIBC_2.2.5>
    1227:	48 8d 05 32 54 00 00 	lea    0x5432(%rip),%rax        # 6660 <stdout@GLIBC_2.2.5>
    122e:	48 39 f8             	cmp    %rdi,%rax
    1231:	74 15                	je     1248 <deregister_tm_clones+0x28>
    1233:	48 8b 05 8e 4d 00 00 	mov    0x4d8e(%rip),%rax        # 5fc8 <_ITM_deregisterTMCloneTable@Base>
    123a:	48 85 c0             	test   %rax,%rax
    123d:	74 09                	je     1248 <deregister_tm_clones+0x28>
    123f:	ff e0                	jmp    *%rax
    1241:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1248:	c3                   	ret
    1249:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001250 <register_tm_clones>:
    1250:	48 8d 3d 09 54 00 00 	lea    0x5409(%rip),%rdi        # 6660 <stdout@GLIBC_2.2.5>
    1257:	48 8d 35 02 54 00 00 	lea    0x5402(%rip),%rsi        # 6660 <stdout@GLIBC_2.2.5>
    125e:	48 29 fe             	sub    %rdi,%rsi
    1261:	48 89 f0             	mov    %rsi,%rax
    1264:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1268:	48 c1 f8 03          	sar    $0x3,%rax
    126c:	48 01 c6             	add    %rax,%rsi
    126f:	48 d1 fe             	sar    %rsi
    1272:	74 14                	je     1288 <register_tm_clones+0x38>
    1274:	48 8b 05 5d 4d 00 00 	mov    0x4d5d(%rip),%rax        # 5fd8 <_ITM_registerTMCloneTable@Base>
    127b:	48 85 c0             	test   %rax,%rax
    127e:	74 08                	je     1288 <register_tm_clones+0x38>
    1280:	ff e0                	jmp    *%rax
    1282:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1288:	c3                   	ret
    1289:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001290 <__do_global_dtors_aux>:
    1290:	f3 0f 1e fa          	endbr64
    1294:	80 3d ed 53 00 00 00 	cmpb   $0x0,0x53ed(%rip)        # 6688 <completed.0>
    129b:	75 2b                	jne    12c8 <__do_global_dtors_aux+0x38>
    129d:	55                   	push   %rbp
    129e:	48 83 3d 3a 4d 00 00 	cmpq   $0x0,0x4d3a(%rip)        # 5fe0 <__cxa_finalize@GLIBC_2.2.5>
    12a5:	00 
    12a6:	48 89 e5             	mov    %rsp,%rbp
    12a9:	74 0c                	je     12b7 <__do_global_dtors_aux+0x27>
    12ab:	48 8b 3d 36 4e 00 00 	mov    0x4e36(%rip),%rdi        # 60e8 <__dso_handle>
    12b2:	e8 29 ff ff ff       	call   11e0 <__cxa_finalize@plt>
    12b7:	e8 64 ff ff ff       	call   1220 <deregister_tm_clones>
    12bc:	c6 05 c5 53 00 00 01 	movb   $0x1,0x53c5(%rip)        # 6688 <completed.0>
    12c3:	5d                   	pop    %rbp
    12c4:	c3                   	ret
    12c5:	0f 1f 00             	nopl   (%rax)
    12c8:	c3                   	ret
    12c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012d0 <frame_dummy>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	e9 77 ff ff ff       	jmp    1250 <register_tm_clones>

00000000000012d9 <main>:
    12d9:	55                   	push   %rbp
    12da:	48 89 e5             	mov    %rsp,%rbp
    12dd:	48 83 ec 20          	sub    $0x20,%rsp
    12e1:	89 7d ec             	mov    %edi,-0x14(%rbp)
    12e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    12e8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    12ec:	75 13                	jne    1301 <main+0x28>
    12ee:	48 8b 05 7b 53 00 00 	mov    0x537b(%rip),%rax        # 6670 <stdin@GLIBC_2.2.5>
    12f5:	48 89 05 94 53 00 00 	mov    %rax,0x5394(%rip)        # 6690 <infile>
    12fc:	e9 91 00 00 00       	jmp    1392 <main+0xb9>
    1301:	83 7d ec 02          	cmpl   $0x2,-0x14(%rbp)
    1305:	75 63                	jne    136a <main+0x91>
    1307:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    130b:	48 83 c0 08          	add    $0x8,%rax
    130f:	48 8b 00             	mov    (%rax),%rax
    1312:	48 8d 15 ef 2c 00 00 	lea    0x2cef(%rip),%rdx        # 4008 <_IO_stdin_used+0x8>
    1319:	48 89 d6             	mov    %rdx,%rsi
    131c:	48 89 c7             	mov    %rax,%rdi
    131f:	e8 4c fe ff ff       	call   1170 <fopen@plt>
    1324:	48 89 05 65 53 00 00 	mov    %rax,0x5365(%rip)        # 6690 <infile>
    132b:	48 8b 05 5e 53 00 00 	mov    0x535e(%rip),%rax        # 6690 <infile>
    1332:	48 85 c0             	test   %rax,%rax
    1335:	75 5b                	jne    1392 <main+0xb9>
    1337:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    133b:	48 83 c0 08          	add    $0x8,%rax
    133f:	48 8b 10             	mov    (%rax),%rdx
    1342:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1346:	48 8b 00             	mov    (%rax),%rax
    1349:	48 89 c6             	mov    %rax,%rsi
    134c:	48 8d 05 b7 2c 00 00 	lea    0x2cb7(%rip),%rax        # 400a <_IO_stdin_used+0xa>
    1353:	48 89 c7             	mov    %rax,%rdi
    1356:	b8 00 00 00 00       	mov    $0x0,%eax
    135b:	e8 40 fd ff ff       	call   10a0 <printf@plt>
    1360:	bf 08 00 00 00       	mov    $0x8,%edi
    1365:	e8 26 fe ff ff       	call   1190 <exit@plt>
    136a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    136e:	48 8b 00             	mov    (%rax),%rax
    1371:	48 89 c6             	mov    %rax,%rsi
    1374:	48 8d 05 ac 2c 00 00 	lea    0x2cac(%rip),%rax        # 4027 <_IO_stdin_used+0x27>
    137b:	48 89 c7             	mov    %rax,%rdi
    137e:	b8 00 00 00 00       	mov    $0x0,%eax
    1383:	e8 18 fd ff ff       	call   10a0 <printf@plt>
    1388:	bf 08 00 00 00       	mov    $0x8,%edi
    138d:	e8 fe fd ff ff       	call   1190 <exit@plt>
    1392:	e8 12 0b 00 00       	call   1ea9 <initialize_bomb>
    1397:	48 8d 05 aa 2c 00 00 	lea    0x2caa(%rip),%rax        # 4048 <_IO_stdin_used+0x48>
    139e:	48 89 c7             	mov    %rax,%rdi
    13a1:	e8 ba fc ff ff       	call   1060 <puts@plt>
    13a6:	48 8d 05 db 2c 00 00 	lea    0x2cdb(%rip),%rax        # 4088 <_IO_stdin_used+0x88>
    13ad:	48 89 c7             	mov    %rax,%rdi
    13b0:	e8 ab fc ff ff       	call   1060 <puts@plt>
    13b5:	e8 c9 0b 00 00       	call   1f83 <read_line>
    13ba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    13be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13c2:	48 89 c7             	mov    %rax,%rdi
    13c5:	e8 d9 00 00 00       	call   14a3 <phase_1>
    13ca:	e8 a4 0d 00 00       	call   2173 <phase_defused>
    13cf:	48 8d 05 e2 2c 00 00 	lea    0x2ce2(%rip),%rax        # 40b8 <_IO_stdin_used+0xb8>
    13d6:	48 89 c7             	mov    %rax,%rdi
    13d9:	e8 82 fc ff ff       	call   1060 <puts@plt>
    13de:	e8 a0 0b 00 00       	call   1f83 <read_line>
    13e3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    13e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13eb:	48 89 c7             	mov    %rax,%rdi
    13ee:	e8 de 00 00 00       	call   14d1 <phase_2>
    13f3:	e8 7b 0d 00 00       	call   2173 <phase_defused>
    13f8:	48 8d 05 e2 2c 00 00 	lea    0x2ce2(%rip),%rax        # 40e1 <_IO_stdin_used+0xe1>
    13ff:	48 89 c7             	mov    %rax,%rdi
    1402:	e8 59 fc ff ff       	call   1060 <puts@plt>
    1407:	e8 77 0b 00 00       	call   1f83 <read_line>
    140c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1410:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1414:	48 89 c7             	mov    %rax,%rdi
    1417:	e8 ae 01 00 00       	call   15ca <phase_3>
    141c:	e8 52 0d 00 00       	call   2173 <phase_defused>
    1421:	48 8d 05 d7 2c 00 00 	lea    0x2cd7(%rip),%rax        # 40ff <_IO_stdin_used+0xff>
    1428:	48 89 c7             	mov    %rax,%rdi
    142b:	e8 30 fc ff ff       	call   1060 <puts@plt>
    1430:	e8 4e 0b 00 00       	call   1f83 <read_line>
    1435:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1439:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    143d:	48 89 c7             	mov    %rax,%rdi
    1440:	e8 e0 03 00 00       	call   1825 <phase_4>
    1445:	e8 29 0d 00 00       	call   2173 <phase_defused>
    144a:	48 8d 05 bf 2c 00 00 	lea    0x2cbf(%rip),%rax        # 4110 <_IO_stdin_used+0x110>
    1451:	48 89 c7             	mov    %rax,%rdi
    1454:	e8 07 fc ff ff       	call   1060 <puts@plt>
    1459:	e8 25 0b 00 00       	call   1f83 <read_line>
    145e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1462:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1466:	48 89 c7             	mov    %rax,%rdi
    1469:	e8 70 04 00 00       	call   18de <phase_5>
    146e:	e8 00 0d 00 00       	call   2173 <phase_defused>
    1473:	48 8d 05 ba 2c 00 00 	lea    0x2cba(%rip),%rax        # 4134 <_IO_stdin_used+0x134>
    147a:	48 89 c7             	mov    %rax,%rdi
    147d:	e8 de fb ff ff       	call   1060 <puts@plt>
    1482:	e8 fc 0a 00 00       	call   1f83 <read_line>
    1487:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    148b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    148f:	48 89 c7             	mov    %rax,%rdi
    1492:	e8 e8 04 00 00       	call   197f <phase_6>
    1497:	e8 d7 0c 00 00       	call   2173 <phase_defused>
    149c:	b8 00 00 00 00       	mov    $0x0,%eax
    14a1:	c9                   	leave
    14a2:	c3                   	ret

00000000000014a3 <phase_1>:
    14a3:	55                   	push   %rbp
    14a4:	48 89 e5             	mov    %rsp,%rbp
    14a7:	48 83 ec 10          	sub    $0x10,%rsp
    14ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14b3:	48 8d 15 9e 2c 00 00 	lea    0x2c9e(%rip),%rdx        # 4158 <_IO_stdin_used+0x158>
    14ba:	48 89 d6             	mov    %rdx,%rsi
    14bd:	48 89 c7             	mov    %rax,%rdi
    14c0:	e8 63 09 00 00       	call   1e28 <strings_not_equal>
    14c5:	85 c0                	test   %eax,%eax
    14c7:	74 05                	je     14ce <phase_1+0x2b>
    14c9:	e8 79 0c 00 00       	call   2147 <explode_bomb>
    14ce:	90                   	nop
    14cf:	c9                   	leave
    14d0:	c3                   	ret

00000000000014d1 <phase_2>:
    14d1:	55                   	push   %rbp
    14d2:	48 89 e5             	mov    %rsp,%rbp
    14d5:	48 83 ec 30          	sub    $0x30,%rsp
    14d9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    14dd:	48 8d 05 9c 2c 00 00 	lea    0x2c9c(%rip),%rax        # 4180 <_IO_stdin_used+0x180>
    14e4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    14e8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
    14ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    14f0:	48 89 d6             	mov    %rdx,%rsi
    14f3:	48 89 c7             	mov    %rax,%rdi
    14f6:	e8 b6 08 00 00       	call   1db1 <read_two_numbers>
    14fb:	8b 45 e8             	mov    -0x18(%rbp),%eax
    14fe:	85 c0                	test   %eax,%eax
    1500:	79 05                	jns    1507 <phase_2+0x36>
    1502:	e8 40 0c 00 00       	call   2147 <explode_bomb>
    1507:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    150e:	e9 92 00 00 00       	jmp    15a5 <phase_2+0xd4>
    1513:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1516:	48 63 d0             	movslq %eax,%rdx
    1519:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    151d:	48 01 d0             	add    %rdx,%rax
    1520:	0f b6 00             	movzbl (%rax),%eax
    1523:	3c 60                	cmp    $0x60,%al
    1525:	7e 34                	jle    155b <phase_2+0x8a>
    1527:	8b 45 fc             	mov    -0x4(%rbp),%eax
    152a:	48 63 d0             	movslq %eax,%rdx
    152d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1531:	48 01 d0             	add    %rdx,%rax
    1534:	0f b6 00             	movzbl (%rax),%eax
    1537:	3c 7a                	cmp    $0x7a,%al
    1539:	7f 20                	jg     155b <phase_2+0x8a>
    153b:	8b 45 e8             	mov    -0x18(%rbp),%eax
    153e:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1541:	48 63 ca             	movslq %edx,%rcx
    1544:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1548:	48 01 ca             	add    %rcx,%rdx
    154b:	0f b6 12             	movzbl (%rdx),%edx
    154e:	0f be d2             	movsbl %dl,%edx
    1551:	83 ea 61             	sub    $0x61,%edx
    1554:	29 d0                	sub    %edx,%eax
    1556:	89 45 e8             	mov    %eax,-0x18(%rbp)
    1559:	eb 46                	jmp    15a1 <phase_2+0xd0>
    155b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    155e:	48 63 d0             	movslq %eax,%rdx
    1561:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1565:	48 01 d0             	add    %rdx,%rax
    1568:	0f b6 00             	movzbl (%rax),%eax
    156b:	3c 40                	cmp    $0x40,%al
    156d:	7e 32                	jle    15a1 <phase_2+0xd0>
    156f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1572:	48 63 d0             	movslq %eax,%rdx
    1575:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1579:	48 01 d0             	add    %rdx,%rax
    157c:	0f b6 00             	movzbl (%rax),%eax
    157f:	3c 5a                	cmp    $0x5a,%al
    1581:	7f 1e                	jg     15a1 <phase_2+0xd0>
    1583:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1586:	8b 55 fc             	mov    -0x4(%rbp),%edx
    1589:	48 63 ca             	movslq %edx,%rcx
    158c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1590:	48 01 ca             	add    %rcx,%rdx
    1593:	0f b6 12             	movzbl (%rdx),%edx
    1596:	0f be d2             	movsbl %dl,%edx
    1599:	83 ea 41             	sub    $0x41,%edx
    159c:	29 d0                	sub    %edx,%eax
    159e:	89 45 ec             	mov    %eax,-0x14(%rbp)
    15a1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    15a5:	83 7d fc 09          	cmpl   $0x9,-0x4(%rbp)
    15a9:	0f 8e 64 ff ff ff    	jle    1513 <phase_2+0x42>
    15af:	8b 45 e8             	mov    -0x18(%rbp),%eax
    15b2:	85 c0                	test   %eax,%eax
    15b4:	74 05                	je     15bb <phase_2+0xea>
    15b6:	e8 8c 0b 00 00       	call   2147 <explode_bomb>
    15bb:	8b 45 ec             	mov    -0x14(%rbp),%eax
    15be:	85 c0                	test   %eax,%eax
    15c0:	74 05                	je     15c7 <phase_2+0xf6>
    15c2:	e8 80 0b 00 00       	call   2147 <explode_bomb>
    15c7:	90                   	nop
    15c8:	c9                   	leave
    15c9:	c3                   	ret

00000000000015ca <phase_3>:
    15ca:	55                   	push   %rbp
    15cb:	48 89 e5             	mov    %rsp,%rbp
    15ce:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    15d5:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
    15dc:	c7 45 d0 02 00 00 00 	movl   $0x2,-0x30(%rbp)
    15e3:	c7 45 d4 04 00 00 00 	movl   $0x4,-0x2c(%rbp)
    15ea:	c7 45 d8 06 00 00 00 	movl   $0x6,-0x28(%rbp)
    15f1:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%rbp)
    15f8:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%rbp)
    15ff:	c7 45 e4 0b 00 00 00 	movl   $0xb,-0x1c(%rbp)
    1606:	c7 45 e8 0a 00 00 00 	movl   $0xa,-0x18(%rbp)
    160d:	c7 45 ec 0d 00 00 00 	movl   $0xd,-0x14(%rbp)
    1614:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    161b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1622:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1629:	48 c7 85 70 ff ff ff 	movq   $0x0,-0x90(%rbp)
    1630:	00 00 00 00 
    1634:	48 c7 85 78 ff ff ff 	movq   $0x0,-0x88(%rbp)
    163b:	00 00 00 00 
    163f:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
    1646:	00 
    1647:	48 c7 45 88 00 00 00 	movq   $0x0,-0x78(%rbp)
    164e:	00 
    164f:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
    1656:	00 
    1657:	48 c7 45 98 00 00 00 	movq   $0x0,-0x68(%rbp)
    165e:	00 
    165f:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
    1666:	00 
    1667:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
    166e:	00 
    166f:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
    1676:	00 
    1677:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    167e:	00 
    167f:	48 8d 4d cc          	lea    -0x34(%rbp),%rcx
    1683:	48 8d 95 70 ff ff ff 	lea    -0x90(%rbp),%rdx
    168a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
    1691:	48 8d 35 0f 2b 00 00 	lea    0x2b0f(%rip),%rsi        # 41a7 <_IO_stdin_used+0x1a7>
    1698:	48 89 c7             	mov    %rax,%rdi
    169b:	b8 00 00 00 00       	mov    $0x0,%eax
    16a0:	e8 ab fa ff ff       	call   1150 <__isoc99_sscanf@plt>
    16a5:	89 45 f8             	mov    %eax,-0x8(%rbp)
    16a8:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
    16ac:	7f 05                	jg     16b3 <phase_3+0xe9>
    16ae:	e8 94 0a 00 00       	call   2147 <explode_bomb>
    16b3:	8b 45 cc             	mov    -0x34(%rbp),%eax
    16b6:	85 c0                	test   %eax,%eax
    16b8:	75 05                	jne    16bf <phase_3+0xf5>
    16ba:	e8 88 0a 00 00       	call   2147 <explode_bomb>
    16bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    16c6:	e9 a9 00 00 00       	jmp    1774 <phase_3+0x1aa>
    16cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
    16ce:	48 98                	cltq
    16d0:	0f b6 84 05 70 ff ff 	movzbl -0x90(%rbp,%rax,1),%eax
    16d7:	ff 
    16d8:	0f be c0             	movsbl %al,%eax
    16db:	83 e8 61             	sub    $0x61,%eax
    16de:	83 f8 07             	cmp    $0x7,%eax
    16e1:	0f 87 89 00 00 00    	ja     1770 <phase_3+0x1a6>
    16e7:	89 c0                	mov    %eax,%eax
    16e9:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    16f0:	00 
    16f1:	48 8d 05 b8 2a 00 00 	lea    0x2ab8(%rip),%rax        # 41b0 <_IO_stdin_used+0x1b0>
    16f8:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    16fb:	48 98                	cltq
    16fd:	48 8d 15 ac 2a 00 00 	lea    0x2aac(%rip),%rdx        # 41b0 <_IO_stdin_used+0x1b0>
    1704:	48 01 d0             	add    %rdx,%rax
    1707:	ff e0                	jmp    *%rax
    1709:	8b 55 cc             	mov    -0x34(%rbp),%edx
    170c:	8b 45 d0             	mov    -0x30(%rbp),%eax
    170f:	29 c2                	sub    %eax,%edx
    1711:	89 55 cc             	mov    %edx,-0x34(%rbp)
    1714:	eb 5a                	jmp    1770 <phase_3+0x1a6>
    1716:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1719:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    171c:	29 c2                	sub    %eax,%edx
    171e:	89 55 cc             	mov    %edx,-0x34(%rbp)
    1721:	eb 4d                	jmp    1770 <phase_3+0x1a6>
    1723:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1726:	8b 45 d8             	mov    -0x28(%rbp),%eax
    1729:	29 c2                	sub    %eax,%edx
    172b:	89 55 cc             	mov    %edx,-0x34(%rbp)
    172e:	eb 40                	jmp    1770 <phase_3+0x1a6>
    1730:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1733:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1736:	29 c2                	sub    %eax,%edx
    1738:	89 55 cc             	mov    %edx,-0x34(%rbp)
    173b:	eb 33                	jmp    1770 <phase_3+0x1a6>
    173d:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1740:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1743:	29 c2                	sub    %eax,%edx
    1745:	89 55 cc             	mov    %edx,-0x34(%rbp)
    1748:	eb 26                	jmp    1770 <phase_3+0x1a6>
    174a:	8b 55 cc             	mov    -0x34(%rbp),%edx
    174d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1750:	29 c2                	sub    %eax,%edx
    1752:	89 55 cc             	mov    %edx,-0x34(%rbp)
    1755:	eb 19                	jmp    1770 <phase_3+0x1a6>
    1757:	8b 55 cc             	mov    -0x34(%rbp),%edx
    175a:	8b 45 e8             	mov    -0x18(%rbp),%eax
    175d:	29 c2                	sub    %eax,%edx
    175f:	89 55 cc             	mov    %edx,-0x34(%rbp)
    1762:	eb 0c                	jmp    1770 <phase_3+0x1a6>
    1764:	8b 55 cc             	mov    -0x34(%rbp),%edx
    1767:	8b 45 ec             	mov    -0x14(%rbp),%eax
    176a:	29 c2                	sub    %eax,%edx
    176c:	89 55 cc             	mov    %edx,-0x34(%rbp)
    176f:	90                   	nop
    1770:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1774:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
    177b:	48 89 c7             	mov    %rax,%rdi
    177e:	e8 73 06 00 00       	call   1df6 <string_length>
    1783:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1786:	0f 8c 3f ff ff ff    	jl     16cb <phase_3+0x101>
    178c:	8b 45 cc             	mov    -0x34(%rbp),%eax
    178f:	85 c0                	test   %eax,%eax
    1791:	74 05                	je     1798 <phase_3+0x1ce>
    1793:	e8 af 09 00 00       	call   2147 <explode_bomb>
    1798:	90                   	nop
    1799:	c9                   	leave
    179a:	c3                   	ret

000000000000179b <func4>:
    179b:	55                   	push   %rbp
    179c:	48 89 e5             	mov    %rsp,%rbp
    179f:	89 7d ec             	mov    %edi,-0x14(%rbp)
    17a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    17a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
    17a9:	48 63 d0             	movslq %eax,%rdx
    17ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    17b0:	48 01 d0             	add    %rdx,%rax
    17b3:	0f b6 08             	movzbl (%rax),%ecx
    17b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
    17b9:	8d 50 04             	lea    0x4(%rax),%edx
    17bc:	89 d0                	mov    %edx,%eax
    17be:	c1 f8 1f             	sar    $0x1f,%eax
    17c1:	c1 e8 1d             	shr    $0x1d,%eax
    17c4:	01 c2                	add    %eax,%edx
    17c6:	83 e2 07             	and    $0x7,%edx
    17c9:	29 c2                	sub    %eax,%edx
    17cb:	89 d0                	mov    %edx,%eax
    17cd:	48 63 d0             	movslq %eax,%rdx
    17d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    17d4:	48 01 d0             	add    %rdx,%rax
    17d7:	0f b6 00             	movzbl (%rax),%eax
    17da:	31 c8                	xor    %ecx,%eax
    17dc:	88 45 fb             	mov    %al,-0x5(%rbp)
    17df:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    17e6:	eb 27                	jmp    180f <func4+0x74>
    17e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
    17eb:	48 63 d0             	movslq %eax,%rdx
    17ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    17f2:	48 01 d0             	add    %rdx,%rax
    17f5:	8b 55 fc             	mov    -0x4(%rbp),%edx
    17f8:	48 63 d2             	movslq %edx,%rdx
    17fb:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
    17ff:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1803:	48 01 ca             	add    %rcx,%rdx
    1806:	0f b6 00             	movzbl (%rax),%eax
    1809:	88 02                	mov    %al,(%rdx)
    180b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    180f:	83 7d fc 06          	cmpl   $0x6,-0x4(%rbp)
    1813:	7e d3                	jle    17e8 <func4+0x4d>
    1815:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1819:	0f b6 55 fb          	movzbl -0x5(%rbp),%edx
    181d:	88 10                	mov    %dl,(%rax)
    181f:	0f be 45 fb          	movsbl -0x5(%rbp),%eax
    1823:	5d                   	pop    %rbp
    1824:	c3                   	ret

0000000000001825 <phase_4>:
    1825:	55                   	push   %rbp
    1826:	48 89 e5             	mov    %rsp,%rbp
    1829:	53                   	push   %rbx
    182a:	48 83 ec 38          	sub    $0x38,%rsp
    182e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    1832:	48 b8 0a 14 1e 28 32 	movabs $0x50463c32281e140a,%rax
    1839:	3c 46 50 
    183c:	48 89 45 dc          	mov    %rax,-0x24(%rbp)
    1840:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    1847:	c7 45 e8 06 00 00 00 	movl   $0x6,-0x18(%rbp)
    184e:	48 8d 4d d8          	lea    -0x28(%rbp),%rcx
    1852:	48 83 c1 03          	add    $0x3,%rcx
    1856:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
    185a:	48 83 c2 02          	add    $0x2,%rdx
    185e:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
    1862:	48 83 c0 01          	add    $0x1,%rax
    1866:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
    186a:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    186e:	49 89 c9             	mov    %rcx,%r9
    1871:	49 89 d0             	mov    %rdx,%r8
    1874:	48 89 c1             	mov    %rax,%rcx
    1877:	48 89 f2             	mov    %rsi,%rdx
    187a:	48 8d 05 4f 29 00 00 	lea    0x294f(%rip),%rax        # 41d0 <_IO_stdin_used+0x1d0>
    1881:	48 89 c6             	mov    %rax,%rsi
    1884:	b8 00 00 00 00       	mov    $0x0,%eax
    1889:	e8 c2 f8 ff ff       	call   1150 <__isoc99_sscanf@plt>
    188e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    1891:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
    1895:	74 05                	je     189c <phase_4+0x77>
    1897:	e8 ab 08 00 00       	call   2147 <explode_bomb>
    189c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    18a3:	eb 2b                	jmp    18d0 <phase_4+0xab>
    18a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
    18a8:	48 98                	cltq
    18aa:	0f b6 44 05 d8       	movzbl -0x28(%rbp,%rax,1),%eax
    18af:	0f be d8             	movsbl %al,%ebx
    18b2:	48 8d 55 dc          	lea    -0x24(%rbp),%rdx
    18b6:	8b 45 e8             	mov    -0x18(%rbp),%eax
    18b9:	48 89 d6             	mov    %rdx,%rsi
    18bc:	89 c7                	mov    %eax,%edi
    18be:	e8 d8 fe ff ff       	call   179b <func4>
    18c3:	39 c3                	cmp    %eax,%ebx
    18c5:	74 05                	je     18cc <phase_4+0xa7>
    18c7:	e8 7b 08 00 00       	call   2147 <explode_bomb>
    18cc:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    18d0:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
    18d4:	7e cf                	jle    18a5 <phase_4+0x80>
    18d6:	90                   	nop
    18d7:	90                   	nop
    18d8:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    18dc:	c9                   	leave
    18dd:	c3                   	ret

00000000000018de <phase_5>:
    18de:	55                   	push   %rbp
    18df:	48 89 e5             	mov    %rsp,%rbp
    18e2:	48 83 ec 30          	sub    $0x30,%rsp
    18e6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    18ea:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
    18ee:	48 8d 55 ec          	lea    -0x14(%rbp),%rdx
    18f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    18f6:	48 8d 35 e7 28 00 00 	lea    0x28e7(%rip),%rsi        # 41e4 <_IO_stdin_used+0x1e4>
    18fd:	48 89 c7             	mov    %rax,%rdi
    1900:	b8 00 00 00 00       	mov    $0x0,%eax
    1905:	e8 46 f8 ff ff       	call   1150 <__isoc99_sscanf@plt>
    190a:	89 45 f4             	mov    %eax,-0xc(%rbp)
    190d:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
    1911:	7f 05                	jg     1918 <phase_5+0x3a>
    1913:	e8 2f 08 00 00       	call   2147 <explode_bomb>
    1918:	8b 45 ec             	mov    -0x14(%rbp),%eax
    191b:	83 e0 0f             	and    $0xf,%eax
    191e:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1921:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1924:	89 45 f0             	mov    %eax,-0x10(%rbp)
    1927:	8b 45 f0             	mov    -0x10(%rbp),%eax
    192a:	89 45 ec             	mov    %eax,-0x14(%rbp)
    192d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1934:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    193b:	eb 24                	jmp    1961 <phase_5+0x83>
    193d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1941:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1944:	48 98                	cltq
    1946:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    194d:	00 
    194e:	48 8d 05 6b 48 00 00 	lea    0x486b(%rip),%rax        # 61c0 <array.0>
    1955:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1958:	89 45 ec             	mov    %eax,-0x14(%rbp)
    195b:	8b 45 ec             	mov    -0x14(%rbp),%eax
    195e:	01 45 f8             	add    %eax,-0x8(%rbp)
    1961:	8b 45 ec             	mov    -0x14(%rbp),%eax
    1964:	83 f8 0f             	cmp    $0xf,%eax
    1967:	75 d4                	jne    193d <phase_5+0x5f>
    1969:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
    196d:	75 08                	jne    1977 <phase_5+0x99>
    196f:	8b 45 e8             	mov    -0x18(%rbp),%eax
    1972:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    1975:	74 05                	je     197c <phase_5+0x9e>
    1977:	e8 cb 07 00 00       	call   2147 <explode_bomb>
    197c:	90                   	nop
    197d:	c9                   	leave
    197e:	c3                   	ret

000000000000197f <phase_6>:
    197f:	55                   	push   %rbp
    1980:	48 89 e5             	mov    %rsp,%rbp
    1983:	48 83 ec 70          	sub    $0x70,%rsp
    1987:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
    198b:	48 8d 05 ae 48 00 00 	lea    0x48ae(%rip),%rax        # 6240 <node1>
    1992:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1996:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
    199a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    199e:	48 89 d6             	mov    %rdx,%rsi
    19a1:	48 89 c7             	mov    %rax,%rdi
    19a4:	e8 9d 03 00 00       	call   1d46 <read_six_numbers>
    19a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    19b0:	eb 54                	jmp    1a06 <phase_6+0x87>
    19b2:	8b 45 f4             	mov    -0xc(%rbp),%eax
    19b5:	48 98                	cltq
    19b7:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    19bb:	85 c0                	test   %eax,%eax
    19bd:	7e 0e                	jle    19cd <phase_6+0x4e>
    19bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
    19c2:	48 98                	cltq
    19c4:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    19c8:	83 f8 06             	cmp    $0x6,%eax
    19cb:	7e 05                	jle    19d2 <phase_6+0x53>
    19cd:	e8 75 07 00 00       	call   2147 <explode_bomb>
    19d2:	8b 45 f4             	mov    -0xc(%rbp),%eax
    19d5:	83 c0 01             	add    $0x1,%eax
    19d8:	89 45 f0             	mov    %eax,-0x10(%rbp)
    19db:	eb 1f                	jmp    19fc <phase_6+0x7d>
    19dd:	8b 45 f4             	mov    -0xc(%rbp),%eax
    19e0:	48 98                	cltq
    19e2:	8b 54 85 d0          	mov    -0x30(%rbp,%rax,4),%edx
    19e6:	8b 45 f0             	mov    -0x10(%rbp),%eax
    19e9:	48 98                	cltq
    19eb:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    19ef:	39 c2                	cmp    %eax,%edx
    19f1:	75 05                	jne    19f8 <phase_6+0x79>
    19f3:	e8 4f 07 00 00       	call   2147 <explode_bomb>
    19f8:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    19fc:	83 7d f0 05          	cmpl   $0x5,-0x10(%rbp)
    1a00:	7e db                	jle    19dd <phase_6+0x5e>
    1a02:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    1a06:	83 7d f4 05          	cmpl   $0x5,-0xc(%rbp)
    1a0a:	7e a6                	jle    19b2 <phase_6+0x33>
    1a0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1a13:	eb 41                	jmp    1a56 <phase_6+0xd7>
    1a15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1a1d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%rbp)
    1a24:	eb 10                	jmp    1a36 <phase_6+0xb7>
    1a26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a2a:	48 8b 40 08          	mov    0x8(%rax),%rax
    1a2e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1a32:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    1a36:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1a39:	48 98                	cltq
    1a3b:	8b 44 85 d0          	mov    -0x30(%rbp,%rax,4),%eax
    1a3f:	39 45 f0             	cmp    %eax,-0x10(%rbp)
    1a42:	7c e2                	jl     1a26 <phase_6+0xa7>
    1a44:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1a47:	48 98                	cltq
    1a49:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1a4d:	48 89 54 c5 a0       	mov    %rdx,-0x60(%rbp,%rax,8)
    1a52:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    1a56:	83 7d f4 05          	cmpl   $0x5,-0xc(%rbp)
    1a5a:	7e b9                	jle    1a15 <phase_6+0x96>
    1a5c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1a60:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1a64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1a68:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1a6c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
    1a73:	eb 22                	jmp    1a97 <phase_6+0x118>
    1a75:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1a78:	48 98                	cltq
    1a7a:	48 8b 54 c5 a0       	mov    -0x60(%rbp,%rax,8),%rdx
    1a7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a83:	48 89 50 08          	mov    %rdx,0x8(%rax)
    1a87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a8b:	48 8b 40 08          	mov    0x8(%rax),%rax
    1a8f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1a93:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    1a97:	83 7d f4 05          	cmpl   $0x5,-0xc(%rbp)
    1a9b:	7e d8                	jle    1a75 <phase_6+0xf6>
    1a9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1aa1:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    1aa8:	00 
    1aa9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1aad:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1ab1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1ab8:	eb 29                	jmp    1ae3 <phase_6+0x164>
    1aba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1abe:	8b 10                	mov    (%rax),%edx
    1ac0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ac4:	48 8b 40 08          	mov    0x8(%rax),%rax
    1ac8:	8b 00                	mov    (%rax),%eax
    1aca:	39 c2                	cmp    %eax,%edx
    1acc:	7d 05                	jge    1ad3 <phase_6+0x154>
    1ace:	e8 74 06 00 00       	call   2147 <explode_bomb>
    1ad3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ad7:	48 8b 40 08          	mov    0x8(%rax),%rax
    1adb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1adf:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    1ae3:	83 7d f4 04          	cmpl   $0x4,-0xc(%rbp)
    1ae7:	7e d1                	jle    1aba <phase_6+0x13b>
    1ae9:	90                   	nop
    1aea:	90                   	nop
    1aeb:	c9                   	leave
    1aec:	c3                   	ret

0000000000001aed <cityName2index>:
    1aed:	55                   	push   %rbp
    1aee:	48 89 e5             	mov    %rsp,%rbp
    1af1:	48 83 ec 20          	sub    $0x20,%rsp
    1af5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1af9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1b00:	eb 34                	jmp    1b36 <cityName2index+0x49>
    1b02:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1b05:	48 98                	cltq
    1b07:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1b0e:	00 
    1b0f:	48 8d 05 7a 46 00 00 	lea    0x467a(%rip),%rax        # 6190 <cityNames>
    1b16:	48 01 c2             	add    %rax,%rdx
    1b19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b1d:	48 89 d6             	mov    %rdx,%rsi
    1b20:	48 89 c7             	mov    %rax,%rdi
    1b23:	e8 00 03 00 00       	call   1e28 <strings_not_equal>
    1b28:	85 c0                	test   %eax,%eax
    1b2a:	75 05                	jne    1b31 <cityName2index+0x44>
    1b2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1b2f:	eb 15                	jmp    1b46 <cityName2index+0x59>
    1b31:	90                   	nop
    1b32:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1b36:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
    1b3a:	7e c6                	jle    1b02 <cityName2index+0x15>
    1b3c:	e8 06 06 00 00       	call   2147 <explode_bomb>
    1b41:	b8 00 00 00 00       	mov    $0x0,%eax
    1b46:	c9                   	leave
    1b47:	c3                   	ret

0000000000001b48 <secret_phase>:
    1b48:	55                   	push   %rbp
    1b49:	48 89 e5             	mov    %rsp,%rbp
    1b4c:	48 81 ec 20 06 00 00 	sub    $0x620,%rsp
    1b53:	e8 2b 04 00 00       	call   1f83 <read_line>
    1b58:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1b5c:	48 8d 85 e0 f9 ff ff 	lea    -0x620(%rbp),%rax
    1b63:	4c 8d 80 00 03 00 00 	lea    0x300(%rax),%r8
    1b6a:	48 8d 85 e0 f9 ff ff 	lea    -0x620(%rbp),%rax
    1b71:	48 8d b8 00 02 00 00 	lea    0x200(%rax),%rdi
    1b78:	48 8d 85 e0 f9 ff ff 	lea    -0x620(%rbp),%rax
    1b7f:	48 8d 88 00 01 00 00 	lea    0x100(%rax),%rcx
    1b86:	48 8d 95 e0 f9 ff ff 	lea    -0x620(%rbp),%rdx
    1b8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b91:	48 8d b5 e0 f9 ff ff 	lea    -0x620(%rbp),%rsi
    1b98:	48 81 c6 00 05 00 00 	add    $0x500,%rsi
    1b9f:	56                   	push   %rsi
    1ba0:	48 8d b5 e0 f9 ff ff 	lea    -0x620(%rbp),%rsi
    1ba7:	48 81 c6 00 04 00 00 	add    $0x400,%rsi
    1bae:	56                   	push   %rsi
    1baf:	4d 89 c1             	mov    %r8,%r9
    1bb2:	49 89 f8             	mov    %rdi,%r8
    1bb5:	48 8d 35 2e 26 00 00 	lea    0x262e(%rip),%rsi        # 41ea <_IO_stdin_used+0x1ea>
    1bbc:	48 89 c7             	mov    %rax,%rdi
    1bbf:	b8 00 00 00 00       	mov    $0x0,%eax
    1bc4:	e8 87 f5 ff ff       	call   1150 <__isoc99_sscanf@plt>
    1bc9:	48 83 c4 10          	add    $0x10,%rsp
    1bcd:	89 45 ec             	mov    %eax,-0x14(%rbp)
    1bd0:	83 7d ec 05          	cmpl   $0x5,-0x14(%rbp)
    1bd4:	7f 05                	jg     1bdb <secret_phase+0x93>
    1bd6:	e8 6c 05 00 00       	call   2147 <explode_bomb>
    1bdb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1be2:	48 8d 85 e0 f9 ff ff 	lea    -0x620(%rbp),%rax
    1be9:	48 89 c7             	mov    %rax,%rdi
    1bec:	e8 fc fe ff ff       	call   1aed <cityName2index>
    1bf1:	89 45 e8             	mov    %eax,-0x18(%rbp)
    1bf4:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    1bfb:	eb 7d                	jmp    1c7a <secret_phase+0x132>
    1bfd:	48 8d 85 e0 f9 ff ff 	lea    -0x620(%rbp),%rax
    1c04:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1c07:	48 63 d2             	movslq %edx,%rdx
    1c0a:	48 c1 e2 08          	shl    $0x8,%rdx
    1c0e:	48 01 d0             	add    %rdx,%rax
    1c11:	48 89 c7             	mov    %rax,%rdi
    1c14:	e8 d4 fe ff ff       	call   1aed <cityName2index>
    1c19:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    1c1c:	8b 45 e8             	mov    -0x18(%rbp),%eax
    1c1f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    1c22:	73 2a                	jae    1c4e <secret_phase+0x106>
    1c24:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    1c27:	8b 55 e8             	mov    -0x18(%rbp),%edx
    1c2a:	48 89 d0             	mov    %rdx,%rax
    1c2d:	48 c1 e0 02          	shl    $0x2,%rax
    1c31:	48 01 d0             	add    %rdx,%rax
    1c34:	48 01 c8             	add    %rcx,%rax
    1c37:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1c3e:	00 
    1c3f:	48 8d 05 da 44 00 00 	lea    0x44da(%rip),%rax        # 6120 <distances>
    1c46:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1c49:	01 45 fc             	add    %eax,-0x4(%rbp)
    1c4c:	eb 28                	jmp    1c76 <secret_phase+0x12e>
    1c4e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1c51:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    1c54:	48 89 d0             	mov    %rdx,%rax
    1c57:	48 c1 e0 02          	shl    $0x2,%rax
    1c5b:	48 01 d0             	add    %rdx,%rax
    1c5e:	48 01 c8             	add    %rcx,%rax
    1c61:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1c68:	00 
    1c69:	48 8d 05 b0 44 00 00 	lea    0x44b0(%rip),%rax        # 6120 <distances>
    1c70:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1c73:	01 45 fc             	add    %eax,-0x4(%rbp)
    1c76:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1c7a:	83 7d f8 04          	cmpl   $0x4,-0x8(%rbp)
    1c7e:	0f 8e 79 ff ff ff    	jle    1bfd <secret_phase+0xb5>
    1c84:	8b 05 1a 45 00 00    	mov    0x451a(%rip),%eax        # 61a4 <minDistance>
    1c8a:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1c8d:	7e 05                	jle    1c94 <secret_phase+0x14c>
    1c8f:	e8 b3 04 00 00       	call   2147 <explode_bomb>
    1c94:	48 8d 05 65 25 00 00 	lea    0x2565(%rip),%rax        # 4200 <_IO_stdin_used+0x200>
    1c9b:	48 89 c7             	mov    %rax,%rdi
    1c9e:	e8 bd f3 ff ff       	call   1060 <puts@plt>
    1ca3:	e8 cb 04 00 00       	call   2173 <phase_defused>
    1ca8:	90                   	nop
    1ca9:	c9                   	leave
    1caa:	c3                   	ret

0000000000001cab <sig_handler>:
    1cab:	55                   	push   %rbp
    1cac:	48 89 e5             	mov    %rsp,%rbp
    1caf:	48 83 ec 10          	sub    $0x10,%rsp
    1cb3:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1cb6:	48 8d 05 cb 25 00 00 	lea    0x25cb(%rip),%rax        # 4288 <_IO_stdin_used+0x288>
    1cbd:	48 89 c7             	mov    %rax,%rdi
    1cc0:	e8 9b f3 ff ff       	call   1060 <puts@plt>
    1cc5:	bf 03 00 00 00       	mov    $0x3,%edi
    1cca:	e8 e1 f4 ff ff       	call   11b0 <sleep@plt>
    1ccf:	48 8d 05 ea 25 00 00 	lea    0x25ea(%rip),%rax        # 42c0 <_IO_stdin_used+0x2c0>
    1cd6:	48 89 c7             	mov    %rax,%rdi
    1cd9:	b8 00 00 00 00       	mov    $0x0,%eax
    1cde:	e8 bd f3 ff ff       	call   10a0 <printf@plt>
    1ce3:	48 8b 05 76 49 00 00 	mov    0x4976(%rip),%rax        # 6660 <stdout@GLIBC_2.2.5>
    1cea:	48 89 c7             	mov    %rax,%rdi
    1ced:	e8 4e f4 ff ff       	call   1140 <fflush@plt>
    1cf2:	bf 01 00 00 00       	mov    $0x1,%edi
    1cf7:	e8 b4 f4 ff ff       	call   11b0 <sleep@plt>
    1cfc:	48 8d 05 c5 25 00 00 	lea    0x25c5(%rip),%rax        # 42c8 <_IO_stdin_used+0x2c8>
    1d03:	48 89 c7             	mov    %rax,%rdi
    1d06:	e8 55 f3 ff ff       	call   1060 <puts@plt>
    1d0b:	bf 10 00 00 00       	mov    $0x10,%edi
    1d10:	e8 7b f4 ff ff       	call   1190 <exit@plt>

0000000000001d15 <invalid_phase>:
    1d15:	55                   	push   %rbp
    1d16:	48 89 e5             	mov    %rsp,%rbp
    1d19:	48 83 ec 10          	sub    $0x10,%rsp
    1d1d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1d21:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1d25:	48 89 c6             	mov    %rax,%rsi
    1d28:	48 8d 05 a1 25 00 00 	lea    0x25a1(%rip),%rax        # 42d0 <_IO_stdin_used+0x2d0>
    1d2f:	48 89 c7             	mov    %rax,%rdi
    1d32:	b8 00 00 00 00       	mov    $0x0,%eax
    1d37:	e8 64 f3 ff ff       	call   10a0 <printf@plt>
    1d3c:	bf 08 00 00 00       	mov    $0x8,%edi
    1d41:	e8 4a f4 ff ff       	call   1190 <exit@plt>

0000000000001d46 <read_six_numbers>:
    1d46:	55                   	push   %rbp
    1d47:	48 89 e5             	mov    %rsp,%rbp
    1d4a:	48 83 ec 20          	sub    $0x20,%rsp
    1d4e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1d52:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1d56:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d5a:	48 8d 78 14          	lea    0x14(%rax),%rdi
    1d5e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d62:	48 8d 70 10          	lea    0x10(%rax),%rsi
    1d66:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d6a:	4c 8d 48 0c          	lea    0xc(%rax),%r9
    1d6e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d72:	4c 8d 40 08          	lea    0x8(%rax),%r8
    1d76:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d7a:	48 8d 48 04          	lea    0x4(%rax),%rcx
    1d7e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1d82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d86:	57                   	push   %rdi
    1d87:	56                   	push   %rsi
    1d88:	48 8d 35 52 25 00 00 	lea    0x2552(%rip),%rsi        # 42e1 <_IO_stdin_used+0x2e1>
    1d8f:	48 89 c7             	mov    %rax,%rdi
    1d92:	b8 00 00 00 00       	mov    $0x0,%eax
    1d97:	e8 b4 f3 ff ff       	call   1150 <__isoc99_sscanf@plt>
    1d9c:	48 83 c4 10          	add    $0x10,%rsp
    1da0:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1da3:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    1da7:	7f 05                	jg     1dae <read_six_numbers+0x68>
    1da9:	e8 99 03 00 00       	call   2147 <explode_bomb>
    1dae:	90                   	nop
    1daf:	c9                   	leave
    1db0:	c3                   	ret

0000000000001db1 <read_two_numbers>:
    1db1:	55                   	push   %rbp
    1db2:	48 89 e5             	mov    %rsp,%rbp
    1db5:	48 83 ec 20          	sub    $0x20,%rsp
    1db9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1dbd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1dc1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1dc5:	48 8d 48 04          	lea    0x4(%rax),%rcx
    1dc9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1dcd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1dd1:	48 8d 35 1b 25 00 00 	lea    0x251b(%rip),%rsi        # 42f3 <_IO_stdin_used+0x2f3>
    1dd8:	48 89 c7             	mov    %rax,%rdi
    1ddb:	b8 00 00 00 00       	mov    $0x0,%eax
    1de0:	e8 6b f3 ff ff       	call   1150 <__isoc99_sscanf@plt>
    1de5:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1de8:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    1dec:	7f 05                	jg     1df3 <read_two_numbers+0x42>
    1dee:	e8 54 03 00 00       	call   2147 <explode_bomb>
    1df3:	90                   	nop
    1df4:	c9                   	leave
    1df5:	c3                   	ret

0000000000001df6 <string_length>:
    1df6:	55                   	push   %rbp
    1df7:	48 89 e5             	mov    %rsp,%rbp
    1dfa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1dfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e02:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1e06:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1e0d:	eb 09                	jmp    1e18 <string_length+0x22>
    1e0f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    1e14:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1e18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1e1c:	0f b6 00             	movzbl (%rax),%eax
    1e1f:	84 c0                	test   %al,%al
    1e21:	75 ec                	jne    1e0f <string_length+0x19>
    1e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1e26:	5d                   	pop    %rbp
    1e27:	c3                   	ret

0000000000001e28 <strings_not_equal>:
    1e28:	55                   	push   %rbp
    1e29:	48 89 e5             	mov    %rsp,%rbp
    1e2c:	53                   	push   %rbx
    1e2d:	48 83 ec 20          	sub    $0x20,%rsp
    1e31:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    1e35:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
    1e39:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1e3d:	48 89 c7             	mov    %rax,%rdi
    1e40:	e8 b1 ff ff ff       	call   1df6 <string_length>
    1e45:	89 c3                	mov    %eax,%ebx
    1e47:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1e4b:	48 89 c7             	mov    %rax,%rdi
    1e4e:	e8 a3 ff ff ff       	call   1df6 <string_length>
    1e53:	39 c3                	cmp    %eax,%ebx
    1e55:	74 07                	je     1e5e <strings_not_equal+0x36>
    1e57:	b8 01 00 00 00       	mov    $0x1,%eax
    1e5c:	eb 45                	jmp    1ea3 <strings_not_equal+0x7b>
    1e5e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1e62:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1e66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1e6a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1e6e:	eb 23                	jmp    1e93 <strings_not_equal+0x6b>
    1e70:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1e74:	0f b6 10             	movzbl (%rax),%edx
    1e77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e7b:	0f b6 00             	movzbl (%rax),%eax
    1e7e:	38 c2                	cmp    %al,%dl
    1e80:	74 07                	je     1e89 <strings_not_equal+0x61>
    1e82:	b8 01 00 00 00       	mov    $0x1,%eax
    1e87:	eb 1a                	jmp    1ea3 <strings_not_equal+0x7b>
    1e89:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    1e8e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    1e93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1e97:	0f b6 00             	movzbl (%rax),%eax
    1e9a:	84 c0                	test   %al,%al
    1e9c:	75 d2                	jne    1e70 <strings_not_equal+0x48>
    1e9e:	b8 00 00 00 00       	mov    $0x0,%eax
    1ea3:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    1ea7:	c9                   	leave
    1ea8:	c3                   	ret

0000000000001ea9 <initialize_bomb>:
    1ea9:	55                   	push   %rbp
    1eaa:	48 89 e5             	mov    %rsp,%rbp
    1ead:	48 8d 05 f7 fd ff ff 	lea    -0x209(%rip),%rax        # 1cab <sig_handler>
    1eb4:	48 89 c6             	mov    %rax,%rsi
    1eb7:	bf 02 00 00 00       	mov    $0x2,%edi
    1ebc:	e8 3f f2 ff ff       	call   1100 <signal@plt>
    1ec1:	90                   	nop
    1ec2:	5d                   	pop    %rbp
    1ec3:	c3                   	ret

0000000000001ec4 <initialize_bomb_solve>:
    1ec4:	55                   	push   %rbp
    1ec5:	48 89 e5             	mov    %rsp,%rbp
    1ec8:	90                   	nop
    1ec9:	5d                   	pop    %rbp
    1eca:	c3                   	ret

0000000000001ecb <blank_line>:
    1ecb:	55                   	push   %rbp
    1ecc:	48 89 e5             	mov    %rsp,%rbp
    1ecf:	48 83 ec 10          	sub    $0x10,%rsp
    1ed3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1ed7:	eb 37                	jmp    1f10 <blank_line+0x45>
    1ed9:	e8 e2 f2 ff ff       	call   11c0 <__ctype_b_loc@plt>
    1ede:	48 8b 08             	mov    (%rax),%rcx
    1ee1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ee5:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1ee9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    1eed:	0f b6 00             	movzbl (%rax),%eax
    1ef0:	48 0f be c0          	movsbq %al,%rax
    1ef4:	48 01 c0             	add    %rax,%rax
    1ef7:	48 01 c8             	add    %rcx,%rax
    1efa:	0f b7 00             	movzwl (%rax),%eax
    1efd:	0f b7 c0             	movzwl %ax,%eax
    1f00:	25 00 20 00 00       	and    $0x2000,%eax
    1f05:	85 c0                	test   %eax,%eax
    1f07:	75 07                	jne    1f10 <blank_line+0x45>
    1f09:	b8 00 00 00 00       	mov    $0x0,%eax
    1f0e:	eb 10                	jmp    1f20 <blank_line+0x55>
    1f10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f14:	0f b6 00             	movzbl (%rax),%eax
    1f17:	84 c0                	test   %al,%al
    1f19:	75 be                	jne    1ed9 <blank_line+0xe>
    1f1b:	b8 01 00 00 00       	mov    $0x1,%eax
    1f20:	c9                   	leave
    1f21:	c3                   	ret

0000000000001f22 <skip>:
    1f22:	55                   	push   %rbp
    1f23:	48 89 e5             	mov    %rsp,%rbp
    1f26:	48 83 ec 10          	sub    $0x10,%rsp
    1f2a:	48 8b 0d 5f 47 00 00 	mov    0x475f(%rip),%rcx        # 6690 <infile>
    1f31:	8b 05 a9 4d 00 00    	mov    0x4da9(%rip),%eax        # 6ce0 <num_input_strings>
    1f37:	48 63 d0             	movslq %eax,%rdx
    1f3a:	48 89 d0             	mov    %rdx,%rax
    1f3d:	48 c1 e0 02          	shl    $0x2,%rax
    1f41:	48 01 d0             	add    %rdx,%rax
    1f44:	48 c1 e0 04          	shl    $0x4,%rax
    1f48:	48 8d 15 51 47 00 00 	lea    0x4751(%rip),%rdx        # 66a0 <input_strings>
    1f4f:	48 01 d0             	add    %rdx,%rax
    1f52:	48 89 ca             	mov    %rcx,%rdx
    1f55:	be 50 00 00 00       	mov    $0x50,%esi
    1f5a:	48 89 c7             	mov    %rax,%rdi
    1f5d:	e8 7e f1 ff ff       	call   10e0 <fgets@plt>
    1f62:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1f66:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    1f6b:	74 10                	je     1f7d <skip+0x5b>
    1f6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f71:	48 89 c7             	mov    %rax,%rdi
    1f74:	e8 52 ff ff ff       	call   1ecb <blank_line>
    1f79:	85 c0                	test   %eax,%eax
    1f7b:	75 ad                	jne    1f2a <skip+0x8>
    1f7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1f81:	c9                   	leave
    1f82:	c3                   	ret

0000000000001f83 <read_line>:
    1f83:	55                   	push   %rbp
    1f84:	48 89 e5             	mov    %rsp,%rbp
    1f87:	48 83 ec 10          	sub    $0x10,%rsp
    1f8b:	b8 00 00 00 00       	mov    $0x0,%eax
    1f90:	e8 8d ff ff ff       	call   1f22 <skip>
    1f95:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1f99:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    1f9e:	0f 85 86 00 00 00    	jne    202a <read_line+0xa7>
    1fa4:	48 8b 15 e5 46 00 00 	mov    0x46e5(%rip),%rdx        # 6690 <infile>
    1fab:	48 8b 05 be 46 00 00 	mov    0x46be(%rip),%rax        # 6670 <stdin@GLIBC_2.2.5>
    1fb2:	48 39 c2             	cmp    %rax,%rdx
    1fb5:	75 19                	jne    1fd0 <read_line+0x4d>
    1fb7:	48 8d 05 3b 23 00 00 	lea    0x233b(%rip),%rax        # 42f9 <_IO_stdin_used+0x2f9>
    1fbe:	48 89 c7             	mov    %rax,%rdi
    1fc1:	e8 9a f0 ff ff       	call   1060 <puts@plt>
    1fc6:	bf 08 00 00 00       	mov    $0x8,%edi
    1fcb:	e8 c0 f1 ff ff       	call   1190 <exit@plt>
    1fd0:	48 8d 05 40 23 00 00 	lea    0x2340(%rip),%rax        # 4317 <_IO_stdin_used+0x317>
    1fd7:	48 89 c7             	mov    %rax,%rdi
    1fda:	e8 51 f0 ff ff       	call   1030 <getenv@plt>
    1fdf:	48 85 c0             	test   %rax,%rax
    1fe2:	74 0a                	je     1fee <read_line+0x6b>
    1fe4:	bf 00 00 00 00       	mov    $0x0,%edi
    1fe9:	e8 a2 f1 ff ff       	call   1190 <exit@plt>
    1fee:	48 8b 05 7b 46 00 00 	mov    0x467b(%rip),%rax        # 6670 <stdin@GLIBC_2.2.5>
    1ff5:	48 89 05 94 46 00 00 	mov    %rax,0x4694(%rip)        # 6690 <infile>
    1ffc:	b8 00 00 00 00       	mov    $0x0,%eax
    2001:	e8 1c ff ff ff       	call   1f22 <skip>
    2006:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    200a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    200f:	75 19                	jne    202a <read_line+0xa7>
    2011:	48 8d 05 e1 22 00 00 	lea    0x22e1(%rip),%rax        # 42f9 <_IO_stdin_used+0x2f9>
    2018:	48 89 c7             	mov    %rax,%rdi
    201b:	e8 40 f0 ff ff       	call   1060 <puts@plt>
    2020:	bf 00 00 00 00       	mov    $0x0,%edi
    2025:	e8 66 f1 ff ff       	call   1190 <exit@plt>
    202a:	8b 05 b0 4c 00 00    	mov    0x4cb0(%rip),%eax        # 6ce0 <num_input_strings>
    2030:	48 63 d0             	movslq %eax,%rdx
    2033:	48 89 d0             	mov    %rdx,%rax
    2036:	48 c1 e0 02          	shl    $0x2,%rax
    203a:	48 01 d0             	add    %rdx,%rax
    203d:	48 c1 e0 04          	shl    $0x4,%rax
    2041:	48 8d 15 58 46 00 00 	lea    0x4658(%rip),%rdx        # 66a0 <input_strings>
    2048:	48 01 d0             	add    %rdx,%rax
    204b:	48 89 c7             	mov    %rax,%rdi
    204e:	e8 2d f0 ff ff       	call   1080 <strlen@plt>
    2053:	89 45 f4             	mov    %eax,-0xc(%rbp)
    2056:	83 7d f4 4e          	cmpl   $0x4e,-0xc(%rbp)
    205a:	7e 59                	jle    20b5 <read_line+0x132>
    205c:	48 8d 05 bf 22 00 00 	lea    0x22bf(%rip),%rax        # 4322 <_IO_stdin_used+0x322>
    2063:	48 89 c7             	mov    %rax,%rdi
    2066:	e8 f5 ef ff ff       	call   1060 <puts@plt>
    206b:	8b 05 6f 4c 00 00    	mov    0x4c6f(%rip),%eax        # 6ce0 <num_input_strings>
    2071:	8d 50 01             	lea    0x1(%rax),%edx
    2074:	89 15 66 4c 00 00    	mov    %edx,0x4c66(%rip)        # 6ce0 <num_input_strings>
    207a:	48 63 d0             	movslq %eax,%rdx
    207d:	48 89 d0             	mov    %rdx,%rax
    2080:	48 c1 e0 02          	shl    $0x2,%rax
    2084:	48 01 d0             	add    %rdx,%rax
    2087:	48 c1 e0 04          	shl    $0x4,%rax
    208b:	48 8d 15 0e 46 00 00 	lea    0x460e(%rip),%rdx        # 66a0 <input_strings>
    2092:	48 01 d0             	add    %rdx,%rax
    2095:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    209c:	75 6e 63 
    209f:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    20a6:	2a 2a 00 
    20a9:	48 89 30             	mov    %rsi,(%rax)
    20ac:	48 89 78 08          	mov    %rdi,0x8(%rax)
    20b0:	e8 92 00 00 00       	call   2147 <explode_bomb>
    20b5:	8b 05 25 4c 00 00    	mov    0x4c25(%rip),%eax        # 6ce0 <num_input_strings>
    20bb:	8b 55 f4             	mov    -0xc(%rbp),%edx
    20be:	83 ea 01             	sub    $0x1,%edx
    20c1:	48 63 ca             	movslq %edx,%rcx
    20c4:	48 63 d0             	movslq %eax,%rdx
    20c7:	48 89 d0             	mov    %rdx,%rax
    20ca:	48 c1 e0 02          	shl    $0x2,%rax
    20ce:	48 01 d0             	add    %rdx,%rax
    20d1:	48 c1 e0 04          	shl    $0x4,%rax
    20d5:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
    20d9:	48 8d 05 c0 45 00 00 	lea    0x45c0(%rip),%rax        # 66a0 <input_strings>
    20e0:	48 01 d0             	add    %rdx,%rax
    20e3:	0f b6 00             	movzbl (%rax),%eax
    20e6:	3c 0a                	cmp    $0xa,%al
    20e8:	75 31                	jne    211b <read_line+0x198>
    20ea:	8b 05 f0 4b 00 00    	mov    0x4bf0(%rip),%eax        # 6ce0 <num_input_strings>
    20f0:	8b 55 f4             	mov    -0xc(%rbp),%edx
    20f3:	83 ea 01             	sub    $0x1,%edx
    20f6:	48 63 ca             	movslq %edx,%rcx
    20f9:	48 63 d0             	movslq %eax,%rdx
    20fc:	48 89 d0             	mov    %rdx,%rax
    20ff:	48 c1 e0 02          	shl    $0x2,%rax
    2103:	48 01 d0             	add    %rdx,%rax
    2106:	48 c1 e0 04          	shl    $0x4,%rax
    210a:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
    210e:	48 8d 05 8b 45 00 00 	lea    0x458b(%rip),%rax        # 66a0 <input_strings>
    2115:	48 01 d0             	add    %rdx,%rax
    2118:	c6 00 00             	movb   $0x0,(%rax)
    211b:	8b 05 bf 4b 00 00    	mov    0x4bbf(%rip),%eax        # 6ce0 <num_input_strings>
    2121:	8d 50 01             	lea    0x1(%rax),%edx
    2124:	89 15 b6 4b 00 00    	mov    %edx,0x4bb6(%rip)        # 6ce0 <num_input_strings>
    212a:	48 63 d0             	movslq %eax,%rdx
    212d:	48 89 d0             	mov    %rdx,%rax
    2130:	48 c1 e0 02          	shl    $0x2,%rax
    2134:	48 01 d0             	add    %rdx,%rax
    2137:	48 c1 e0 04          	shl    $0x4,%rax
    213b:	48 8d 15 5e 45 00 00 	lea    0x455e(%rip),%rdx        # 66a0 <input_strings>
    2142:	48 01 d0             	add    %rdx,%rax
    2145:	c9                   	leave
    2146:	c3                   	ret

0000000000002147 <explode_bomb>:
    2147:	55                   	push   %rbp
    2148:	48 89 e5             	mov    %rsp,%rbp
    214b:	48 8d 05 eb 21 00 00 	lea    0x21eb(%rip),%rax        # 433d <_IO_stdin_used+0x33d>
    2152:	48 89 c7             	mov    %rax,%rdi
    2155:	e8 06 ef ff ff       	call   1060 <puts@plt>
    215a:	48 8d 05 e5 21 00 00 	lea    0x21e5(%rip),%rax        # 4346 <_IO_stdin_used+0x346>
    2161:	48 89 c7             	mov    %rax,%rdi
    2164:	e8 f7 ee ff ff       	call   1060 <puts@plt>
    2169:	bf 08 00 00 00       	mov    $0x8,%edi
    216e:	e8 1d f0 ff ff       	call   1190 <exit@plt>

0000000000002173 <phase_defused>:
    2173:	55                   	push   %rbp
    2174:	48 89 e5             	mov    %rsp,%rbp
    2177:	48 83 ec 70          	sub    $0x70,%rsp
    217b:	8b 05 5f 4b 00 00    	mov    0x4b5f(%rip),%eax        # 6ce0 <num_input_strings>
    2181:	83 f8 06             	cmp    $0x6,%eax
    2184:	0f 85 a1 00 00 00    	jne    222b <phase_defused+0xb8>
    218a:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
    218e:	48 8d 75 94          	lea    -0x6c(%rbp),%rsi
    2192:	48 8d 55 98          	lea    -0x68(%rbp),%rdx
    2196:	48 8d 45 9c          	lea    -0x64(%rbp),%rax
    219a:	48 83 ec 08          	sub    $0x8,%rsp
    219e:	48 8d 4d a0          	lea    -0x60(%rbp),%rcx
    21a2:	51                   	push   %rcx
    21a3:	49 89 f9             	mov    %rdi,%r9
    21a6:	49 89 f0             	mov    %rsi,%r8
    21a9:	48 89 d1             	mov    %rdx,%rcx
    21ac:	48 89 c2             	mov    %rax,%rdx
    21af:	48 8d 05 a7 21 00 00 	lea    0x21a7(%rip),%rax        # 435d <_IO_stdin_used+0x35d>
    21b6:	48 89 c6             	mov    %rax,%rsi
    21b9:	48 8d 05 d0 45 00 00 	lea    0x45d0(%rip),%rax        # 6790 <input_strings+0xf0>
    21c0:	48 89 c7             	mov    %rax,%rdi
    21c3:	b8 00 00 00 00       	mov    $0x0,%eax
    21c8:	e8 83 ef ff ff       	call   1150 <__isoc99_sscanf@plt>
    21cd:	48 83 c4 10          	add    $0x10,%rsp
    21d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    21d4:	83 7d fc 05          	cmpl   $0x5,-0x4(%rbp)
    21d8:	75 42                	jne    221c <phase_defused+0xa9>
    21da:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
    21de:	48 8d 15 87 21 00 00 	lea    0x2187(%rip),%rdx        # 436c <_IO_stdin_used+0x36c>
    21e5:	48 89 d6             	mov    %rdx,%rsi
    21e8:	48 89 c7             	mov    %rax,%rdi
    21eb:	e8 38 fc ff ff       	call   1e28 <strings_not_equal>
    21f0:	85 c0                	test   %eax,%eax
    21f2:	75 28                	jne    221c <phase_defused+0xa9>
    21f4:	48 8d 05 7d 21 00 00 	lea    0x217d(%rip),%rax        # 4378 <_IO_stdin_used+0x378>
    21fb:	48 89 c7             	mov    %rax,%rdi
    21fe:	e8 5d ee ff ff       	call   1060 <puts@plt>
    2203:	48 8d 05 96 21 00 00 	lea    0x2196(%rip),%rax        # 43a0 <_IO_stdin_used+0x3a0>
    220a:	48 89 c7             	mov    %rax,%rdi
    220d:	e8 4e ee ff ff       	call   1060 <puts@plt>
    2212:	b8 00 00 00 00       	mov    $0x0,%eax
    2217:	e8 2c f9 ff ff       	call   1b48 <secret_phase>
    221c:	48 8d 05 b5 21 00 00 	lea    0x21b5(%rip),%rax        # 43d8 <_IO_stdin_used+0x3d8>
    2223:	48 89 c7             	mov    %rax,%rdi
    2226:	e8 35 ee ff ff       	call   1060 <puts@plt>
    222b:	90                   	nop
    222c:	c9                   	leave
    222d:	c3                   	ret

000000000000222e <sigalrm_handler>:
    222e:	55                   	push   %rbp
    222f:	48 89 e5             	mov    %rsp,%rbp
    2232:	48 83 ec 10          	sub    $0x10,%rsp
    2236:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2239:	48 8b 05 40 44 00 00 	mov    0x4440(%rip),%rax        # 6680 <stderr@GLIBC_2.2.5>
    2240:	ba 00 00 00 00       	mov    $0x0,%edx
    2245:	48 8d 0d bc 21 00 00 	lea    0x21bc(%rip),%rcx        # 4408 <_IO_stdin_used+0x408>
    224c:	48 89 ce             	mov    %rcx,%rsi
    224f:	48 89 c7             	mov    %rax,%rdi
    2252:	b8 00 00 00 00       	mov    $0x0,%eax
    2257:	e8 c4 ee ff ff       	call   1120 <fprintf@plt>
    225c:	bf 01 00 00 00       	mov    $0x1,%edi
    2261:	e8 2a ef ff ff       	call   1190 <exit@plt>

0000000000002266 <rio_readinitb>:
    2266:	55                   	push   %rbp
    2267:	48 89 e5             	mov    %rsp,%rbp
    226a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    226e:	89 75 f4             	mov    %esi,-0xc(%rbp)
    2271:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2275:	8b 55 f4             	mov    -0xc(%rbp),%edx
    2278:	89 10                	mov    %edx,(%rax)
    227a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    227e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
    2285:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2289:	48 8d 50 10          	lea    0x10(%rax),%rdx
    228d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2291:	48 89 50 08          	mov    %rdx,0x8(%rax)
    2295:	90                   	nop
    2296:	5d                   	pop    %rbp
    2297:	c3                   	ret

0000000000002298 <rio_read>:
    2298:	55                   	push   %rbp
    2299:	48 89 e5             	mov    %rsp,%rbp
    229c:	48 83 ec 30          	sub    $0x30,%rsp
    22a0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    22a4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    22a8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    22ac:	eb 6e                	jmp    231c <rio_read+0x84>
    22ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    22b2:	48 8d 48 10          	lea    0x10(%rax),%rcx
    22b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    22ba:	8b 00                	mov    (%rax),%eax
    22bc:	ba 00 20 00 00       	mov    $0x2000,%edx
    22c1:	48 89 ce             	mov    %rcx,%rsi
    22c4:	89 c7                	mov    %eax,%edi
    22c6:	e8 05 ee ff ff       	call   10d0 <read@plt>
    22cb:	89 c2                	mov    %eax,%edx
    22cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    22d1:	89 50 04             	mov    %edx,0x4(%rax)
    22d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    22d8:	8b 40 04             	mov    0x4(%rax),%eax
    22db:	85 c0                	test   %eax,%eax
    22dd:	79 18                	jns    22f7 <rio_read+0x5f>
    22df:	e8 5c ed ff ff       	call   1040 <__errno_location@plt>
    22e4:	8b 00                	mov    (%rax),%eax
    22e6:	83 f8 04             	cmp    $0x4,%eax
    22e9:	74 31                	je     231c <rio_read+0x84>
    22eb:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    22f2:	e9 9d 00 00 00       	jmp    2394 <rio_read+0xfc>
    22f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    22fb:	8b 40 04             	mov    0x4(%rax),%eax
    22fe:	85 c0                	test   %eax,%eax
    2300:	75 0a                	jne    230c <rio_read+0x74>
    2302:	b8 00 00 00 00       	mov    $0x0,%eax
    2307:	e9 88 00 00 00       	jmp    2394 <rio_read+0xfc>
    230c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2310:	48 8d 50 10          	lea    0x10(%rax),%rdx
    2314:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2318:	48 89 50 08          	mov    %rdx,0x8(%rax)
    231c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2320:	8b 40 04             	mov    0x4(%rax),%eax
    2323:	85 c0                	test   %eax,%eax
    2325:	7e 87                	jle    22ae <rio_read+0x16>
    2327:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    232b:	89 45 fc             	mov    %eax,-0x4(%rbp)
    232e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2332:	8b 40 04             	mov    0x4(%rax),%eax
    2335:	48 98                	cltq
    2337:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
    233b:	73 0a                	jae    2347 <rio_read+0xaf>
    233d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2341:	8b 40 04             	mov    0x4(%rax),%eax
    2344:	89 45 fc             	mov    %eax,-0x4(%rbp)
    2347:	8b 45 fc             	mov    -0x4(%rbp),%eax
    234a:	48 63 d0             	movslq %eax,%rdx
    234d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2351:	48 8b 48 08          	mov    0x8(%rax),%rcx
    2355:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2359:	48 89 ce             	mov    %rcx,%rsi
    235c:	48 89 c7             	mov    %rax,%rdi
    235f:	e8 cc ed ff ff       	call   1130 <memcpy@plt>
    2364:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2368:	48 8b 50 08          	mov    0x8(%rax),%rdx
    236c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    236f:	48 98                	cltq
    2371:	48 01 c2             	add    %rax,%rdx
    2374:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2378:	48 89 50 08          	mov    %rdx,0x8(%rax)
    237c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2380:	8b 40 04             	mov    0x4(%rax),%eax
    2383:	2b 45 fc             	sub    -0x4(%rbp),%eax
    2386:	89 c2                	mov    %eax,%edx
    2388:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    238c:	89 50 04             	mov    %edx,0x4(%rax)
    238f:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2392:	48 98                	cltq
    2394:	c9                   	leave
    2395:	c3                   	ret

0000000000002396 <rio_readlineb>:
    2396:	55                   	push   %rbp
    2397:	48 89 e5             	mov    %rsp,%rbp
    239a:	48 83 ec 40          	sub    $0x40,%rsp
    239e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    23a2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    23a6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    23aa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    23ae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    23b2:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
    23b9:	eb 5d                	jmp    2418 <rio_readlineb+0x82>
    23bb:	48 8d 4d eb          	lea    -0x15(%rbp),%rcx
    23bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    23c3:	ba 01 00 00 00       	mov    $0x1,%edx
    23c8:	48 89 ce             	mov    %rcx,%rsi
    23cb:	48 89 c7             	mov    %rax,%rdi
    23ce:	e8 c5 fe ff ff       	call   2298 <rio_read>
    23d3:	89 45 ec             	mov    %eax,-0x14(%rbp)
    23d6:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    23da:	75 1c                	jne    23f8 <rio_readlineb+0x62>
    23dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    23e0:	48 8d 50 01          	lea    0x1(%rax),%rdx
    23e4:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    23e8:	0f b6 55 eb          	movzbl -0x15(%rbp),%edx
    23ec:	88 10                	mov    %dl,(%rax)
    23ee:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
    23f2:	3c 0a                	cmp    $0xa,%al
    23f4:	75 1e                	jne    2414 <rio_readlineb+0x7e>
    23f6:	eb 2e                	jmp    2426 <rio_readlineb+0x90>
    23f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    23fc:	75 0d                	jne    240b <rio_readlineb+0x75>
    23fe:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    2402:	75 21                	jne    2425 <rio_readlineb+0x8f>
    2404:	b8 00 00 00 00       	mov    $0x0,%eax
    2409:	eb 27                	jmp    2432 <rio_readlineb+0x9c>
    240b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2412:	eb 1e                	jmp    2432 <rio_readlineb+0x9c>
    2414:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    2418:	8b 45 fc             	mov    -0x4(%rbp),%eax
    241b:	48 98                	cltq
    241d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
    2421:	72 98                	jb     23bb <rio_readlineb+0x25>
    2423:	eb 01                	jmp    2426 <rio_readlineb+0x90>
    2425:	90                   	nop
    2426:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    242a:	c6 00 00             	movb   $0x0,(%rax)
    242d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2430:	48 98                	cltq
    2432:	c9                   	leave
    2433:	c3                   	ret

0000000000002434 <rio_writen>:
    2434:	55                   	push   %rbp
    2435:	48 89 e5             	mov    %rsp,%rbp
    2438:	48 83 ec 40          	sub    $0x40,%rsp
    243c:	89 7d dc             	mov    %edi,-0x24(%rbp)
    243f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2443:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    2447:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    244b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    244f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2453:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2457:	eb 4f                	jmp    24a8 <rio_writen+0x74>
    2459:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    245d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    2461:	8b 45 dc             	mov    -0x24(%rbp),%eax
    2464:	48 89 ce             	mov    %rcx,%rsi
    2467:	89 c7                	mov    %eax,%edi
    2469:	e8 02 ec ff ff       	call   1070 <write@plt>
    246e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    2472:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    2477:	7f 1f                	jg     2498 <rio_writen+0x64>
    2479:	e8 c2 eb ff ff       	call   1040 <__errno_location@plt>
    247e:	8b 00                	mov    (%rax),%eax
    2480:	83 f8 04             	cmp    $0x4,%eax
    2483:	75 0a                	jne    248f <rio_writen+0x5b>
    2485:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    248c:	00 
    248d:	eb 09                	jmp    2498 <rio_writen+0x64>
    248f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    2496:	eb 1b                	jmp    24b3 <rio_writen+0x7f>
    2498:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    249c:	48 29 45 f8          	sub    %rax,-0x8(%rbp)
    24a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    24a4:	48 01 45 e8          	add    %rax,-0x18(%rbp)
    24a8:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    24ad:	75 aa                	jne    2459 <rio_writen+0x25>
    24af:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    24b3:	c9                   	leave
    24b4:	c3                   	ret

00000000000024b5 <urlencode>:
    24b5:	55                   	push   %rbp
    24b6:	48 89 e5             	mov    %rsp,%rbp
    24b9:	48 83 ec 20          	sub    $0x20,%rsp
    24bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    24c1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    24c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    24c9:	48 89 c7             	mov    %rax,%rdi
    24cc:	e8 af eb ff ff       	call   1080 <strlen@plt>
    24d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    24d4:	e9 37 01 00 00       	jmp    2610 <urlencode+0x15b>
    24d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    24dd:	0f b6 00             	movzbl (%rax),%eax
    24e0:	3c 2a                	cmp    $0x2a,%al
    24e2:	74 63                	je     2547 <urlencode+0x92>
    24e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    24e8:	0f b6 00             	movzbl (%rax),%eax
    24eb:	3c 2d                	cmp    $0x2d,%al
    24ed:	74 58                	je     2547 <urlencode+0x92>
    24ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    24f3:	0f b6 00             	movzbl (%rax),%eax
    24f6:	3c 2e                	cmp    $0x2e,%al
    24f8:	74 4d                	je     2547 <urlencode+0x92>
    24fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    24fe:	0f b6 00             	movzbl (%rax),%eax
    2501:	3c 5f                	cmp    $0x5f,%al
    2503:	74 42                	je     2547 <urlencode+0x92>
    2505:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2509:	0f b6 00             	movzbl (%rax),%eax
    250c:	3c 2f                	cmp    $0x2f,%al
    250e:	76 0b                	jbe    251b <urlencode+0x66>
    2510:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2514:	0f b6 00             	movzbl (%rax),%eax
    2517:	3c 39                	cmp    $0x39,%al
    2519:	76 2c                	jbe    2547 <urlencode+0x92>
    251b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    251f:	0f b6 00             	movzbl (%rax),%eax
    2522:	3c 40                	cmp    $0x40,%al
    2524:	76 0b                	jbe    2531 <urlencode+0x7c>
    2526:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    252a:	0f b6 00             	movzbl (%rax),%eax
    252d:	3c 5a                	cmp    $0x5a,%al
    252f:	76 16                	jbe    2547 <urlencode+0x92>
    2531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2535:	0f b6 00             	movzbl (%rax),%eax
    2538:	3c 60                	cmp    $0x60,%al
    253a:	76 25                	jbe    2561 <urlencode+0xac>
    253c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2540:	0f b6 00             	movzbl (%rax),%eax
    2543:	3c 7a                	cmp    $0x7a,%al
    2545:	77 1a                	ja     2561 <urlencode+0xac>
    2547:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    254b:	48 8d 50 01          	lea    0x1(%rax),%rdx
    254f:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2553:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2557:	0f b6 12             	movzbl (%rdx),%edx
    255a:	88 10                	mov    %dl,(%rax)
    255c:	e9 aa 00 00 00       	jmp    260b <urlencode+0x156>
    2561:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2565:	0f b6 00             	movzbl (%rax),%eax
    2568:	3c 20                	cmp    $0x20,%al
    256a:	75 14                	jne    2580 <urlencode+0xcb>
    256c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2570:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2574:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2578:	c6 00 2b             	movb   $0x2b,(%rax)
    257b:	e9 8b 00 00 00       	jmp    260b <urlencode+0x156>
    2580:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2584:	0f b6 00             	movzbl (%rax),%eax
    2587:	3c 1f                	cmp    $0x1f,%al
    2589:	76 0b                	jbe    2596 <urlencode+0xe1>
    258b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    258f:	0f b6 00             	movzbl (%rax),%eax
    2592:	84 c0                	test   %al,%al
    2594:	79 0b                	jns    25a1 <urlencode+0xec>
    2596:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    259a:	0f b6 00             	movzbl (%rax),%eax
    259d:	3c 09                	cmp    $0x9,%al
    259f:	75 63                	jne    2604 <urlencode+0x14f>
    25a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    25a5:	0f b6 00             	movzbl (%rax),%eax
    25a8:	0f b6 d0             	movzbl %al,%edx
    25ab:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
    25af:	48 8d 0d 76 1e 00 00 	lea    0x1e76(%rip),%rcx        # 442c <_IO_stdin_used+0x42c>
    25b6:	48 89 ce             	mov    %rcx,%rsi
    25b9:	48 89 c7             	mov    %rax,%rdi
    25bc:	b8 00 00 00 00       	mov    $0x0,%eax
    25c1:	e8 ba eb ff ff       	call   1180 <sprintf@plt>
    25c6:	0f b6 4d f4          	movzbl -0xc(%rbp),%ecx
    25ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    25ce:	48 8d 50 01          	lea    0x1(%rax),%rdx
    25d2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    25d6:	89 ca                	mov    %ecx,%edx
    25d8:	88 10                	mov    %dl,(%rax)
    25da:	0f b6 4d f5          	movzbl -0xb(%rbp),%ecx
    25de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    25e2:	48 8d 50 01          	lea    0x1(%rax),%rdx
    25e6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    25ea:	89 ca                	mov    %ecx,%edx
    25ec:	88 10                	mov    %dl,(%rax)
    25ee:	0f b6 4d f6          	movzbl -0xa(%rbp),%ecx
    25f2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    25f6:	48 8d 50 01          	lea    0x1(%rax),%rdx
    25fa:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    25fe:	89 ca                	mov    %ecx,%edx
    2600:	88 10                	mov    %dl,(%rax)
    2602:	eb 07                	jmp    260b <urlencode+0x156>
    2604:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2609:	eb 1b                	jmp    2626 <urlencode+0x171>
    260b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    2610:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2613:	8d 50 ff             	lea    -0x1(%rax),%edx
    2616:	89 55 fc             	mov    %edx,-0x4(%rbp)
    2619:	85 c0                	test   %eax,%eax
    261b:	0f 85 b8 fe ff ff    	jne    24d9 <urlencode+0x24>
    2621:	b8 00 00 00 00       	mov    $0x0,%eax
    2626:	c9                   	leave
    2627:	c3                   	ret

0000000000002628 <submitr>:
    2628:	55                   	push   %rbp
    2629:	48 89 e5             	mov    %rsp,%rbp
    262c:	53                   	push   %rbx
    262d:	48 81 ec 38 a0 00 00 	sub    $0xa038,%rsp
    2634:	48 89 bd e8 5f ff ff 	mov    %rdi,-0xa018(%rbp)
    263b:	89 b5 e4 5f ff ff    	mov    %esi,-0xa01c(%rbp)
    2641:	48 89 95 d8 5f ff ff 	mov    %rdx,-0xa028(%rbp)
    2648:	48 89 8d d0 5f ff ff 	mov    %rcx,-0xa030(%rbp)
    264f:	4c 89 85 c8 5f ff ff 	mov    %r8,-0xa038(%rbp)
    2656:	4c 89 8d c0 5f ff ff 	mov    %r9,-0xa040(%rbp)
    265d:	c7 85 fc 7f ff ff 00 	movl   $0x0,-0x8004(%rbp)
    2664:	00 00 00 
    2667:	ba 00 00 00 00       	mov    $0x0,%edx
    266c:	be 01 00 00 00       	mov    $0x1,%esi
    2671:	bf 02 00 00 00       	mov    $0x2,%edi
    2676:	e8 55 eb ff ff       	call   11d0 <socket@plt>
    267b:	89 45 ec             	mov    %eax,-0x14(%rbp)
    267e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    2682:	79 53                	jns    26d7 <submitr+0xaf>
    2684:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2688:	48 bb 45 72 72 6f 72 	movabs $0x43203a726f727245,%rbx
    268f:	3a 20 43 
    2692:	48 be 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rsi
    2699:	20 75 6e 
    269c:	48 89 18             	mov    %rbx,(%rax)
    269f:	48 89 70 08          	mov    %rsi,0x8(%rax)
    26a3:	48 bb 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rbx
    26aa:	74 6f 20 
    26ad:	48 be 63 72 65 61 74 	movabs $0x7320657461657263,%rsi
    26b4:	65 20 73 
    26b7:	48 89 58 10          	mov    %rbx,0x10(%rax)
    26bb:	48 89 70 18          	mov    %rsi,0x18(%rax)
    26bf:	48 bf 20 73 6f 63 6b 	movabs $0x74656b636f7320,%rdi
    26c6:	65 74 00 
    26c9:	48 89 78 1e          	mov    %rdi,0x1e(%rax)
    26cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    26d2:	e9 8c 06 00 00       	jmp    2d63 <submitr+0x73b>
    26d7:	48 8b 85 e8 5f ff ff 	mov    -0xa018(%rbp),%rax
    26de:	48 89 c7             	mov    %rax,%rdi
    26e1:	e8 2a ea ff ff       	call   1110 <gethostbyname@plt>
    26e6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    26ea:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    26ef:	75 6b                	jne    275c <submitr+0x134>
    26f1:	48 8b 45 10          	mov    0x10(%rbp),%rax
    26f5:	48 bb 45 72 72 6f 72 	movabs $0x44203a726f727245,%rbx
    26fc:	3a 20 44 
    26ff:	48 be 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rsi
    2706:	20 75 6e 
    2709:	48 89 18             	mov    %rbx,(%rax)
    270c:	48 89 70 08          	mov    %rsi,0x8(%rax)
    2710:	48 bb 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rbx
    2717:	74 6f 20 
    271a:	48 be 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rsi
    2721:	76 65 20 
    2724:	48 89 58 10          	mov    %rbx,0x10(%rax)
    2728:	48 89 70 18          	mov    %rsi,0x18(%rax)
    272c:	48 bb 20 73 65 72 76 	movabs $0x2072657672657320,%rbx
    2733:	65 72 20 
    2736:	48 be 61 64 64 72 65 	movabs $0x73736572646461,%rsi
    273d:	73 73 00 
    2740:	48 89 58 1f          	mov    %rbx,0x1f(%rax)
    2744:	48 89 70 27          	mov    %rsi,0x27(%rax)
    2748:	8b 45 ec             	mov    -0x14(%rbp),%eax
    274b:	89 c7                	mov    %eax,%edi
    274d:	e8 6e e9 ff ff       	call   10c0 <close@plt>
    2752:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2757:	e9 07 06 00 00       	jmp    2d63 <submitr+0x73b>
    275c:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2760:	66 0f ef c0          	pxor   %xmm0,%xmm0
    2764:	0f 29 00             	movaps %xmm0,(%rax)
    2767:	66 c7 45 c0 02 00    	movw   $0x2,-0x40(%rbp)
    276d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2771:	8b 40 14             	mov    0x14(%rax),%eax
    2774:	48 63 d0             	movslq %eax,%rdx
    2777:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    277b:	48 8b 40 18          	mov    0x18(%rax),%rax
    277f:	48 8b 00             	mov    (%rax),%rax
    2782:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
    2786:	48 83 c1 04          	add    $0x4,%rcx
    278a:	48 89 c6             	mov    %rax,%rsi
    278d:	48 89 cf             	mov    %rcx,%rdi
    2790:	e8 cb e9 ff ff       	call   1160 <memmove@plt>
    2795:	8b 85 e4 5f ff ff    	mov    -0xa01c(%rbp),%eax
    279b:	0f b7 c0             	movzwl %ax,%eax
    279e:	89 c7                	mov    %eax,%edi
    27a0:	e8 eb e8 ff ff       	call   1090 <htons@plt>
    27a5:	66 89 45 c2          	mov    %ax,-0x3e(%rbp)
    27a9:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
    27ad:	8b 45 ec             	mov    -0x14(%rbp),%eax
    27b0:	ba 10 00 00 00       	mov    $0x10,%edx
    27b5:	48 89 ce             	mov    %rcx,%rsi
    27b8:	89 c7                	mov    %eax,%edi
    27ba:	e8 e1 e9 ff ff       	call   11a0 <connect@plt>
    27bf:	85 c0                	test   %eax,%eax
    27c1:	79 5d                	jns    2820 <submitr+0x1f8>
    27c3:	48 8b 45 10          	mov    0x10(%rbp),%rax
    27c7:	48 bb 45 72 72 6f 72 	movabs $0x55203a726f727245,%rbx
    27ce:	3a 20 55 
    27d1:	48 be 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rsi
    27d8:	20 74 6f 
    27db:	48 89 18             	mov    %rbx,(%rax)
    27de:	48 89 70 08          	mov    %rsi,0x8(%rax)
    27e2:	48 bb 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rbx
    27e9:	65 63 74 
    27ec:	48 be 20 74 6f 20 74 	movabs $0x20656874206f7420,%rsi
    27f3:	68 65 20 
    27f6:	48 89 58 10          	mov    %rbx,0x10(%rax)
    27fa:	48 89 70 18          	mov    %rsi,0x18(%rax)
    27fe:	48 bf 20 73 65 72 76 	movabs $0x72657672657320,%rdi
    2805:	65 72 00 
    2808:	48 89 78 1f          	mov    %rdi,0x1f(%rax)
    280c:	8b 45 ec             	mov    -0x14(%rbp),%eax
    280f:	89 c7                	mov    %eax,%edi
    2811:	e8 aa e8 ff ff       	call   10c0 <close@plt>
    2816:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    281b:	e9 43 05 00 00       	jmp    2d63 <submitr+0x73b>
    2820:	48 8b 85 c0 5f ff ff 	mov    -0xa040(%rbp),%rax
    2827:	48 89 c7             	mov    %rax,%rdi
    282a:	e8 51 e8 ff ff       	call   1080 <strlen@plt>
    282f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    2833:	48 8b 85 d8 5f ff ff 	mov    -0xa028(%rbp),%rax
    283a:	48 89 c7             	mov    %rax,%rdi
    283d:	e8 3e e8 ff ff       	call   1080 <strlen@plt>
    2842:	48 89 c3             	mov    %rax,%rbx
    2845:	48 8b 85 d0 5f ff ff 	mov    -0xa030(%rbp),%rax
    284c:	48 89 c7             	mov    %rax,%rdi
    284f:	e8 2c e8 ff ff       	call   1080 <strlen@plt>
    2854:	48 01 c3             	add    %rax,%rbx
    2857:	48 8b 85 c8 5f ff ff 	mov    -0xa038(%rbp),%rax
    285e:	48 89 c7             	mov    %rax,%rdi
    2861:	e8 1a e8 ff ff       	call   1080 <strlen@plt>
    2866:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
    286a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    286e:	48 89 d0             	mov    %rdx,%rax
    2871:	48 01 c0             	add    %rax,%rax
    2874:	48 01 d0             	add    %rdx,%rax
    2877:	48 01 c8             	add    %rcx,%rax
    287a:	48 83 e8 80          	sub    $0xffffffffffffff80,%rax
    287e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2882:	48 81 7d d0 b0 1f 00 	cmpq   $0x1fb0,-0x30(%rbp)
    2889:	00 
    288a:	76 79                	jbe    2905 <submitr+0x2dd>
    288c:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2890:	48 bb 45 72 72 6f 72 	movabs $0x52203a726f727245,%rbx
    2897:	3a 20 52 
    289a:	48 be 65 73 75 6c 74 	movabs $0x747320746c757365,%rsi
    28a1:	20 73 74 
    28a4:	48 89 18             	mov    %rbx,(%rax)
    28a7:	48 89 70 08          	mov    %rsi,0x8(%rax)
    28ab:	48 bb 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rbx
    28b2:	74 6f 6f 
    28b5:	48 be 20 6c 61 72 67 	movabs $0x202e656772616c20,%rsi
    28bc:	65 2e 20 
    28bf:	48 89 58 10          	mov    %rbx,0x10(%rax)
    28c3:	48 89 70 18          	mov    %rsi,0x18(%rax)
    28c7:	48 bb 49 6e 63 72 65 	movabs $0x6573616572636e49,%rbx
    28ce:	61 73 65 
    28d1:	48 be 20 53 55 42 4d 	movabs $0x5254494d42555320,%rsi
    28d8:	49 54 52 
    28db:	48 89 58 20          	mov    %rbx,0x20(%rax)
    28df:	48 89 70 28          	mov    %rsi,0x28(%rax)
    28e3:	48 bf 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rdi
    28ea:	55 46 00 
    28ed:	48 89 78 30          	mov    %rdi,0x30(%rax)
    28f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
    28f4:	89 c7                	mov    %eax,%edi
    28f6:	e8 c5 e7 ff ff       	call   10c0 <close@plt>
    28fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2900:	e9 5e 04 00 00       	jmp    2d63 <submitr+0x73b>
    2905:	48 8d 85 00 a0 ff ff 	lea    -0x6000(%rbp),%rax
    290c:	48 89 c6             	mov    %rax,%rsi
    290f:	b8 00 00 00 00       	mov    $0x0,%eax
    2914:	ba f6 03 00 00       	mov    $0x3f6,%edx
    2919:	48 89 f7             	mov    %rsi,%rdi
    291c:	48 89 d1             	mov    %rdx,%rcx
    291f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    2922:	48 8d 95 00 a0 ff ff 	lea    -0x6000(%rbp),%rdx
    2929:	48 8b 85 c0 5f ff ff 	mov    -0xa040(%rbp),%rax
    2930:	48 89 d6             	mov    %rdx,%rsi
    2933:	48 89 c7             	mov    %rax,%rdi
    2936:	e8 7a fb ff ff       	call   24b5 <urlencode>
    293b:	85 c0                	test   %eax,%eax
    293d:	0f 89 8e 00 00 00    	jns    29d1 <submitr+0x3a9>
    2943:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2947:	48 bb 45 72 72 6f 72 	movabs $0x52203a726f727245,%rbx
    294e:	3a 20 52 
    2951:	48 be 65 73 75 6c 74 	movabs $0x747320746c757365,%rsi
    2958:	20 73 74 
    295b:	48 89 18             	mov    %rbx,(%rax)
    295e:	48 89 70 08          	mov    %rsi,0x8(%rax)
    2962:	48 bb 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rbx
    2969:	63 6f 6e 
    296c:	48 be 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rsi
    2973:	20 61 6e 
    2976:	48 89 58 10          	mov    %rbx,0x10(%rax)
    297a:	48 89 70 18          	mov    %rsi,0x18(%rax)
    297e:	48 b9 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rcx
    2985:	67 61 6c 
    2988:	48 bb 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rbx
    298f:	6e 70 72 
    2992:	48 89 48 20          	mov    %rcx,0x20(%rax)
    2996:	48 89 58 28          	mov    %rbx,0x28(%rax)
    299a:	48 b9 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rcx
    29a1:	6c 65 20 
    29a4:	48 bb 63 68 61 72 61 	movabs $0x6574636172616863,%rbx
    29ab:	63 74 65 
    29ae:	48 89 48 30          	mov    %rcx,0x30(%rax)
    29b2:	48 89 58 38          	mov    %rbx,0x38(%rax)
    29b6:	c7 40 3f 65 72 2e 00 	movl   $0x2e7265,0x3f(%rax)
    29bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
    29c0:	89 c7                	mov    %eax,%edi
    29c2:	e8 f9 e6 ff ff       	call   10c0 <close@plt>
    29c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    29cc:	e9 92 03 00 00       	jmp    2d63 <submitr+0x73b>
    29d1:	48 8d bd 00 a0 ff ff 	lea    -0x6000(%rbp),%rdi
    29d8:	48 8b b5 c8 5f ff ff 	mov    -0xa038(%rbp),%rsi
    29df:	48 8b 8d d0 5f ff ff 	mov    -0xa030(%rbp),%rcx
    29e6:	48 8b 95 d8 5f ff ff 	mov    -0xa028(%rbp),%rdx
    29ed:	48 8d 85 b0 bf ff ff 	lea    -0x4050(%rbp),%rax
    29f4:	49 89 f9             	mov    %rdi,%r9
    29f7:	49 89 f0             	mov    %rsi,%r8
    29fa:	48 8d 35 37 1a 00 00 	lea    0x1a37(%rip),%rsi        # 4438 <_IO_stdin_used+0x438>
    2a01:	48 89 c7             	mov    %rax,%rdi
    2a04:	b8 00 00 00 00       	mov    $0x0,%eax
    2a09:	e8 72 e7 ff ff       	call   1180 <sprintf@plt>
    2a0e:	48 8d 85 b0 bf ff ff 	lea    -0x4050(%rbp),%rax
    2a15:	48 89 c7             	mov    %rax,%rdi
    2a18:	e8 63 e6 ff ff       	call   1080 <strlen@plt>
    2a1d:	48 89 c2             	mov    %rax,%rdx
    2a20:	48 8d 8d b0 bf ff ff 	lea    -0x4050(%rbp),%rcx
    2a27:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2a2a:	48 89 ce             	mov    %rcx,%rsi
    2a2d:	89 c7                	mov    %eax,%edi
    2a2f:	e8 00 fa ff ff       	call   2434 <rio_writen>
    2a34:	48 85 c0             	test   %rax,%rax
    2a37:	79 6b                	jns    2aa4 <submitr+0x47c>
    2a39:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2a3d:	48 b9 45 72 72 6f 72 	movabs $0x43203a726f727245,%rcx
    2a44:	3a 20 43 
    2a47:	48 bb 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rbx
    2a4e:	20 75 6e 
    2a51:	48 89 08             	mov    %rcx,(%rax)
    2a54:	48 89 58 08          	mov    %rbx,0x8(%rax)
    2a58:	48 b9 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rcx
    2a5f:	74 6f 20 
    2a62:	48 bb 77 72 69 74 65 	movabs $0x6f74206574697277,%rbx
    2a69:	20 74 6f 
    2a6c:	48 89 48 10          	mov    %rcx,0x10(%rax)
    2a70:	48 89 58 18          	mov    %rbx,0x18(%rax)
    2a74:	48 ba 65 20 74 6f 20 	movabs $0x656874206f742065,%rdx
    2a7b:	74 68 65 
    2a7e:	48 b9 20 73 65 72 76 	movabs $0x72657672657320,%rcx
    2a85:	65 72 00 
    2a88:	48 89 50 1c          	mov    %rdx,0x1c(%rax)
    2a8c:	48 89 48 24          	mov    %rcx,0x24(%rax)
    2a90:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2a93:	89 c7                	mov    %eax,%edi
    2a95:	e8 26 e6 ff ff       	call   10c0 <close@plt>
    2a9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2a9f:	e9 bf 02 00 00       	jmp    2d63 <submitr+0x73b>
    2aa4:	8b 55 ec             	mov    -0x14(%rbp),%edx
    2aa7:	48 8d 85 b0 df ff ff 	lea    -0x2050(%rbp),%rax
    2aae:	89 d6                	mov    %edx,%esi
    2ab0:	48 89 c7             	mov    %rax,%rdi
    2ab3:	e8 ae f7 ff ff       	call   2266 <rio_readinitb>
    2ab8:	48 8d 8d b0 bf ff ff 	lea    -0x4050(%rbp),%rcx
    2abf:	48 8d 85 b0 df ff ff 	lea    -0x2050(%rbp),%rax
    2ac6:	ba 00 20 00 00       	mov    $0x2000,%edx
    2acb:	48 89 ce             	mov    %rcx,%rsi
    2ace:	48 89 c7             	mov    %rax,%rdi
    2ad1:	e8 c0 f8 ff ff       	call   2396 <rio_readlineb>
    2ad6:	48 85 c0             	test   %rax,%rax
    2ad9:	7f 79                	jg     2b54 <submitr+0x52c>
    2adb:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2adf:	48 bb 45 72 72 6f 72 	movabs $0x43203a726f727245,%rbx
    2ae6:	3a 20 43 
    2ae9:	48 be 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rsi
    2af0:	20 75 6e 
    2af3:	48 89 18             	mov    %rbx,(%rax)
    2af6:	48 89 70 08          	mov    %rsi,0x8(%rax)
    2afa:	48 ba 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rdx
    2b01:	74 6f 20 
    2b04:	48 b9 72 65 61 64 20 	movabs $0x7269662064616572,%rcx
    2b0b:	66 69 72 
    2b0e:	48 89 50 10          	mov    %rdx,0x10(%rax)
    2b12:	48 89 48 18          	mov    %rcx,0x18(%rax)
    2b16:	48 bb 73 74 20 68 65 	movabs $0x6564616568207473,%rbx
    2b1d:	61 64 65 
    2b20:	48 be 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rsi
    2b27:	6d 20 73 
    2b2a:	48 89 58 20          	mov    %rbx,0x20(%rax)
    2b2e:	48 89 70 28          	mov    %rsi,0x28(%rax)
    2b32:	48 bf 20 73 65 72 76 	movabs $0x72657672657320,%rdi
    2b39:	65 72 00 
    2b3c:	48 89 78 2e          	mov    %rdi,0x2e(%rax)
    2b40:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2b43:	89 c7                	mov    %eax,%edi
    2b45:	e8 76 e5 ff ff       	call   10c0 <close@plt>
    2b4a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2b4f:	e9 0f 02 00 00       	jmp    2d63 <submitr+0x73b>
    2b54:	48 8d b5 f0 5f ff ff 	lea    -0xa010(%rbp),%rsi
    2b5b:	48 8d 8d fc 7f ff ff 	lea    -0x8004(%rbp),%rcx
    2b62:	48 8d 95 00 80 ff ff 	lea    -0x8000(%rbp),%rdx
    2b69:	48 8d 85 b0 bf ff ff 	lea    -0x4050(%rbp),%rax
    2b70:	49 89 f0             	mov    %rsi,%r8
    2b73:	48 8d 35 08 19 00 00 	lea    0x1908(%rip),%rsi        # 4482 <_IO_stdin_used+0x482>
    2b7a:	48 89 c7             	mov    %rax,%rdi
    2b7d:	b8 00 00 00 00       	mov    $0x0,%eax
    2b82:	e8 c9 e5 ff ff       	call   1150 <__isoc99_sscanf@plt>
    2b87:	8b 85 fc 7f ff ff    	mov    -0x8004(%rbp),%eax
    2b8d:	3d c8 00 00 00       	cmp    $0xc8,%eax
    2b92:	0f 84 cb 00 00 00    	je     2c63 <submitr+0x63b>
    2b98:	8b 95 fc 7f ff ff    	mov    -0x8004(%rbp),%edx
    2b9e:	48 8d 8d f0 5f ff ff 	lea    -0xa010(%rbp),%rcx
    2ba5:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2ba9:	48 8d 35 e8 18 00 00 	lea    0x18e8(%rip),%rsi        # 4498 <_IO_stdin_used+0x498>
    2bb0:	48 89 c7             	mov    %rax,%rdi
    2bb3:	b8 00 00 00 00       	mov    $0x0,%eax
    2bb8:	e8 c3 e5 ff ff       	call   1180 <sprintf@plt>
    2bbd:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2bc0:	89 c7                	mov    %eax,%edi
    2bc2:	e8 f9 e4 ff ff       	call   10c0 <close@plt>
    2bc7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2bcc:	e9 92 01 00 00       	jmp    2d63 <submitr+0x73b>
    2bd1:	48 8d 8d b0 bf ff ff 	lea    -0x4050(%rbp),%rcx
    2bd8:	48 8d 85 b0 df ff ff 	lea    -0x2050(%rbp),%rax
    2bdf:	ba 00 20 00 00       	mov    $0x2000,%edx
    2be4:	48 89 ce             	mov    %rcx,%rsi
    2be7:	48 89 c7             	mov    %rax,%rdi
    2bea:	e8 a7 f7 ff ff       	call   2396 <rio_readlineb>
    2bef:	48 85 c0             	test   %rax,%rax
    2bf2:	7f 6f                	jg     2c63 <submitr+0x63b>
    2bf4:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2bf8:	48 ba 45 72 72 6f 72 	movabs $0x43203a726f727245,%rdx
    2bff:	3a 20 43 
    2c02:	48 b9 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rcx
    2c09:	20 75 6e 
    2c0c:	48 89 10             	mov    %rdx,(%rax)
    2c0f:	48 89 48 08          	mov    %rcx,0x8(%rax)
    2c13:	48 bb 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rbx
    2c1a:	74 6f 20 
    2c1d:	48 be 72 65 61 64 20 	movabs $0x6165682064616572,%rsi
    2c24:	68 65 61 
    2c27:	48 89 58 10          	mov    %rbx,0x10(%rax)
    2c2b:	48 89 70 18          	mov    %rsi,0x18(%rax)
    2c2f:	48 ba 64 65 72 73 20 	movabs $0x6f72662073726564,%rdx
    2c36:	66 72 6f 
    2c39:	48 b9 6d 20 73 65 72 	movabs $0x726576726573206d,%rcx
    2c40:	76 65 72 
    2c43:	48 89 50 20          	mov    %rdx,0x20(%rax)
    2c47:	48 89 48 28          	mov    %rcx,0x28(%rax)
    2c4b:	c6 40 30 00          	movb   $0x0,0x30(%rax)
    2c4f:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2c52:	89 c7                	mov    %eax,%edi
    2c54:	e8 67 e4 ff ff       	call   10c0 <close@plt>
    2c59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2c5e:	e9 00 01 00 00       	jmp    2d63 <submitr+0x73b>
    2c63:	48 8d 85 b0 bf ff ff 	lea    -0x4050(%rbp),%rax
    2c6a:	48 8d 15 54 18 00 00 	lea    0x1854(%rip),%rdx        # 44c5 <_IO_stdin_used+0x4c5>
    2c71:	48 89 d6             	mov    %rdx,%rsi
    2c74:	48 89 c7             	mov    %rax,%rdi
    2c77:	e8 74 e4 ff ff       	call   10f0 <strcmp@plt>
    2c7c:	85 c0                	test   %eax,%eax
    2c7e:	0f 85 4d ff ff ff    	jne    2bd1 <submitr+0x5a9>
    2c84:	48 8d 8d b0 bf ff ff 	lea    -0x4050(%rbp),%rcx
    2c8b:	48 8d 85 b0 df ff ff 	lea    -0x2050(%rbp),%rax
    2c92:	ba 00 20 00 00       	mov    $0x2000,%edx
    2c97:	48 89 ce             	mov    %rcx,%rsi
    2c9a:	48 89 c7             	mov    %rax,%rdi
    2c9d:	e8 f4 f6 ff ff       	call   2396 <rio_readlineb>
    2ca2:	48 85 c0             	test   %rax,%rax
    2ca5:	7f 76                	jg     2d1d <submitr+0x6f5>
    2ca7:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2cab:	48 bb 45 72 72 6f 72 	movabs $0x43203a726f727245,%rbx
    2cb2:	3a 20 43 
    2cb5:	48 be 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rsi
    2cbc:	20 75 6e 
    2cbf:	48 89 18             	mov    %rbx,(%rax)
    2cc2:	48 89 70 08          	mov    %rsi,0x8(%rax)
    2cc6:	48 ba 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rdx
    2ccd:	74 6f 20 
    2cd0:	48 b9 72 65 61 64 20 	movabs $0x6174732064616572,%rcx
    2cd7:	73 74 61 
    2cda:	48 89 50 10          	mov    %rdx,0x10(%rax)
    2cde:	48 89 48 18          	mov    %rcx,0x18(%rax)
    2ce2:	48 bb 74 75 73 20 6d 	movabs $0x7373656d20737574,%rbx
    2ce9:	65 73 73 
    2cec:	48 be 61 67 65 20 66 	movabs $0x6d6f726620656761,%rsi
    2cf3:	72 6f 6d 
    2cf6:	48 89 58 20          	mov    %rbx,0x20(%rax)
    2cfa:	48 89 70 28          	mov    %rsi,0x28(%rax)
    2cfe:	48 bf 20 73 65 72 76 	movabs $0x72657672657320,%rdi
    2d05:	65 72 00 
    2d08:	48 89 78 30          	mov    %rdi,0x30(%rax)
    2d0c:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2d0f:	89 c7                	mov    %eax,%edi
    2d11:	e8 aa e3 ff ff       	call   10c0 <close@plt>
    2d16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2d1b:	eb 46                	jmp    2d63 <submitr+0x73b>
    2d1d:	48 8d 95 b0 bf ff ff 	lea    -0x4050(%rbp),%rdx
    2d24:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2d28:	48 89 d6             	mov    %rdx,%rsi
    2d2b:	48 89 c7             	mov    %rax,%rdi
    2d2e:	e8 1d e3 ff ff       	call   1050 <strcpy@plt>
    2d33:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2d36:	89 c7                	mov    %eax,%edi
    2d38:	e8 83 e3 ff ff       	call   10c0 <close@plt>
    2d3d:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2d41:	48 8d 15 80 17 00 00 	lea    0x1780(%rip),%rdx        # 44c8 <_IO_stdin_used+0x4c8>
    2d48:	48 89 d6             	mov    %rdx,%rsi
    2d4b:	48 89 c7             	mov    %rax,%rdi
    2d4e:	e8 9d e3 ff ff       	call   10f0 <strcmp@plt>
    2d53:	85 c0                	test   %eax,%eax
    2d55:	75 07                	jne    2d5e <submitr+0x736>
    2d57:	b8 00 00 00 00       	mov    $0x0,%eax
    2d5c:	eb 05                	jmp    2d63 <submitr+0x73b>
    2d5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2d63:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    2d67:	c9                   	leave
    2d68:	c3                   	ret

0000000000002d69 <init_timeout>:
    2d69:	55                   	push   %rbp
    2d6a:	48 89 e5             	mov    %rsp,%rbp
    2d6d:	48 83 ec 10          	sub    $0x10,%rsp
    2d71:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2d74:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    2d78:	74 2d                	je     2da7 <init_timeout+0x3e>
    2d7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    2d7e:	79 07                	jns    2d87 <init_timeout+0x1e>
    2d80:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    2d87:	48 8d 05 a0 f4 ff ff 	lea    -0xb60(%rip),%rax        # 222e <sigalrm_handler>
    2d8e:	48 89 c6             	mov    %rax,%rsi
    2d91:	bf 0e 00 00 00       	mov    $0xe,%edi
    2d96:	e8 65 e3 ff ff       	call   1100 <signal@plt>
    2d9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2d9e:	89 c7                	mov    %eax,%edi
    2da0:	e8 0b e3 ff ff       	call   10b0 <alarm@plt>
    2da5:	eb 01                	jmp    2da8 <init_timeout+0x3f>
    2da7:	90                   	nop
    2da8:	c9                   	leave
    2da9:	c3                   	ret

0000000000002daa <init_driver>:
    2daa:	55                   	push   %rbp
    2dab:	48 89 e5             	mov    %rsp,%rbp
    2dae:	48 83 ec 40          	sub    $0x40,%rsp
    2db2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    2db6:	48 8d 05 0e 17 00 00 	lea    0x170e(%rip),%rax        # 44cb <_IO_stdin_used+0x4cb>
    2dbd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2dc1:	c7 45 f4 6e 3b 00 00 	movl   $0x3b6e,-0xc(%rbp)
    2dc8:	be 01 00 00 00       	mov    $0x1,%esi
    2dcd:	bf 0d 00 00 00       	mov    $0xd,%edi
    2dd2:	e8 29 e3 ff ff       	call   1100 <signal@plt>
    2dd7:	be 01 00 00 00       	mov    $0x1,%esi
    2ddc:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2de1:	e8 1a e3 ff ff       	call   1100 <signal@plt>
    2de6:	be 01 00 00 00       	mov    $0x1,%esi
    2deb:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2df0:	e8 0b e3 ff ff       	call   1100 <signal@plt>
    2df5:	ba 00 00 00 00       	mov    $0x0,%edx
    2dfa:	be 01 00 00 00       	mov    $0x1,%esi
    2dff:	bf 02 00 00 00       	mov    $0x2,%edi
    2e04:	e8 c7 e3 ff ff       	call   11d0 <socket@plt>
    2e09:	89 45 f0             	mov    %eax,-0x10(%rbp)
    2e0c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    2e10:	79 53                	jns    2e65 <init_driver+0xbb>
    2e12:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2e16:	48 be 45 72 72 6f 72 	movabs $0x43203a726f727245,%rsi
    2e1d:	3a 20 43 
    2e20:	48 bf 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdi
    2e27:	20 75 6e 
    2e2a:	48 89 30             	mov    %rsi,(%rax)
    2e2d:	48 89 78 08          	mov    %rdi,0x8(%rax)
    2e31:	48 ba 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rdx
    2e38:	74 6f 20 
    2e3b:	48 b9 63 72 65 61 74 	movabs $0x7320657461657263,%rcx
    2e42:	65 20 73 
    2e45:	48 89 50 10          	mov    %rdx,0x10(%rax)
    2e49:	48 89 48 18          	mov    %rcx,0x18(%rax)
    2e4d:	48 ba 20 73 6f 63 6b 	movabs $0x74656b636f7320,%rdx
    2e54:	65 74 00 
    2e57:	48 89 50 1e          	mov    %rdx,0x1e(%rax)
    2e5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2e60:	e9 32 01 00 00       	jmp    2f97 <init_driver+0x1ed>
    2e65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2e69:	48 89 c7             	mov    %rax,%rdi
    2e6c:	e8 9f e2 ff ff       	call   1110 <gethostbyname@plt>
    2e71:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2e75:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    2e7a:	75 6b                	jne    2ee7 <init_driver+0x13d>
    2e7c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2e80:	48 be 45 72 72 6f 72 	movabs $0x44203a726f727245,%rsi
    2e87:	3a 20 44 
    2e8a:	48 bf 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdi
    2e91:	20 75 6e 
    2e94:	48 89 30             	mov    %rsi,(%rax)
    2e97:	48 89 78 08          	mov    %rdi,0x8(%rax)
    2e9b:	48 ba 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rdx
    2ea2:	74 6f 20 
    2ea5:	48 b9 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rcx
    2eac:	76 65 20 
    2eaf:	48 89 50 10          	mov    %rdx,0x10(%rax)
    2eb3:	48 89 48 18          	mov    %rcx,0x18(%rax)
    2eb7:	48 be 20 73 65 72 76 	movabs $0x2072657672657320,%rsi
    2ebe:	65 72 20 
    2ec1:	48 bf 61 64 64 72 65 	movabs $0x73736572646461,%rdi
    2ec8:	73 73 00 
    2ecb:	48 89 70 1f          	mov    %rsi,0x1f(%rax)
    2ecf:	48 89 78 27          	mov    %rdi,0x27(%rax)
    2ed3:	8b 45 f0             	mov    -0x10(%rbp),%eax
    2ed6:	89 c7                	mov    %eax,%edi
    2ed8:	e8 e3 e1 ff ff       	call   10c0 <close@plt>
    2edd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2ee2:	e9 b0 00 00 00       	jmp    2f97 <init_driver+0x1ed>
    2ee7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2eeb:	66 0f ef c0          	pxor   %xmm0,%xmm0
    2eef:	0f 29 00             	movaps %xmm0,(%rax)
    2ef2:	66 c7 45 d0 02 00    	movw   $0x2,-0x30(%rbp)
    2ef8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2efc:	8b 40 14             	mov    0x14(%rax),%eax
    2eff:	48 63 d0             	movslq %eax,%rdx
    2f02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2f06:	48 8b 40 18          	mov    0x18(%rax),%rax
    2f0a:	48 8b 00             	mov    (%rax),%rax
    2f0d:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    2f11:	48 83 c1 04          	add    $0x4,%rcx
    2f15:	48 89 c6             	mov    %rax,%rsi
    2f18:	48 89 cf             	mov    %rcx,%rdi
    2f1b:	e8 40 e2 ff ff       	call   1160 <memmove@plt>
    2f20:	8b 45 f4             	mov    -0xc(%rbp),%eax
    2f23:	0f b7 c0             	movzwl %ax,%eax
    2f26:	89 c7                	mov    %eax,%edi
    2f28:	e8 63 e1 ff ff       	call   1090 <htons@plt>
    2f2d:	66 89 45 d2          	mov    %ax,-0x2e(%rbp)
    2f31:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    2f35:	8b 45 f0             	mov    -0x10(%rbp),%eax
    2f38:	ba 10 00 00 00       	mov    $0x10,%edx
    2f3d:	48 89 ce             	mov    %rcx,%rsi
    2f40:	89 c7                	mov    %eax,%edi
    2f42:	e8 59 e2 ff ff       	call   11a0 <connect@plt>
    2f47:	85 c0                	test   %eax,%eax
    2f49:	79 30                	jns    2f7b <init_driver+0x1d1>
    2f4b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2f4f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2f53:	48 8d 0d 8e 15 00 00 	lea    0x158e(%rip),%rcx        # 44e8 <_IO_stdin_used+0x4e8>
    2f5a:	48 89 ce             	mov    %rcx,%rsi
    2f5d:	48 89 c7             	mov    %rax,%rdi
    2f60:	b8 00 00 00 00       	mov    $0x0,%eax
    2f65:	e8 16 e2 ff ff       	call   1180 <sprintf@plt>
    2f6a:	8b 45 f0             	mov    -0x10(%rbp),%eax
    2f6d:	89 c7                	mov    %eax,%edi
    2f6f:	e8 4c e1 ff ff       	call   10c0 <close@plt>
    2f74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2f79:	eb 1c                	jmp    2f97 <init_driver+0x1ed>
    2f7b:	8b 45 f0             	mov    -0x10(%rbp),%eax
    2f7e:	89 c7                	mov    %eax,%edi
    2f80:	e8 3b e1 ff ff       	call   10c0 <close@plt>
    2f85:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2f89:	66 c7 00 4f 4b       	movw   $0x4b4f,(%rax)
    2f8e:	c6 40 02 00          	movb   $0x0,0x2(%rax)
    2f92:	b8 00 00 00 00       	mov    $0x0,%eax
    2f97:	c9                   	leave
    2f98:	c3                   	ret

0000000000002f99 <driver_post>:
    2f99:	55                   	push   %rbp
    2f9a:	48 89 e5             	mov    %rsp,%rbp
    2f9d:	48 83 ec 30          	sub    $0x30,%rsp
    2fa1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2fa5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    2fa9:	89 55 dc             	mov    %edx,-0x24(%rbp)
    2fac:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    2fb0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
    2fb4:	74 2f                	je     2fe5 <driver_post+0x4c>
    2fb6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2fba:	48 89 c6             	mov    %rax,%rsi
    2fbd:	48 8d 05 4a 15 00 00 	lea    0x154a(%rip),%rax        # 450e <_IO_stdin_used+0x50e>
    2fc4:	48 89 c7             	mov    %rax,%rdi
    2fc7:	b8 00 00 00 00       	mov    $0x0,%eax
    2fcc:	e8 cf e0 ff ff       	call   10a0 <printf@plt>
    2fd1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2fd5:	66 c7 00 4f 4b       	movw   $0x4b4f,(%rax)
    2fda:	c6 40 02 00          	movb   $0x0,0x2(%rax)
    2fde:	b8 00 00 00 00       	mov    $0x0,%eax
    2fe3:	eb 6d                	jmp    3052 <driver_post+0xb9>
    2fe5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    2fea:	74 54                	je     3040 <driver_post+0xa7>
    2fec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2ff0:	0f b6 00             	movzbl (%rax),%eax
    2ff3:	0f b6 c0             	movzbl %al,%eax
    2ff6:	85 c0                	test   %eax,%eax
    2ff8:	74 46                	je     3040 <driver_post+0xa7>
    2ffa:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    2ffe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3002:	48 83 ec 08          	sub    $0x8,%rsp
    3006:	ff 75 d0             	push   -0x30(%rbp)
    3009:	49 89 d1             	mov    %rdx,%r9
    300c:	4c 8d 05 12 15 00 00 	lea    0x1512(%rip),%r8        # 4525 <_IO_stdin_used+0x525>
    3013:	48 89 c1             	mov    %rax,%rcx
    3016:	48 8d 05 10 15 00 00 	lea    0x1510(%rip),%rax        # 452d <_IO_stdin_used+0x52d>
    301d:	48 89 c2             	mov    %rax,%rdx
    3020:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
    3025:	48 8d 05 9f 14 00 00 	lea    0x149f(%rip),%rax        # 44cb <_IO_stdin_used+0x4cb>
    302c:	48 89 c7             	mov    %rax,%rdi
    302f:	e8 f4 f5 ff ff       	call   2628 <submitr>
    3034:	48 83 c4 10          	add    $0x10,%rsp
    3038:	89 45 fc             	mov    %eax,-0x4(%rbp)
    303b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    303e:	eb 12                	jmp    3052 <driver_post+0xb9>
    3040:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3044:	66 c7 00 4f 4b       	movw   $0x4b4f,(%rax)
    3049:	c6 40 02 00          	movb   $0x0,0x2(%rax)
    304d:	b8 00 00 00 00       	mov    $0x0,%eax
    3052:	c9                   	leave
    3053:	c3                   	ret

Disassembly of section .fini:

0000000000003054 <_fini>:
    3054:	48 83 ec 08          	sub    $0x8,%rsp
    3058:	48 83 c4 08          	add    $0x8,%rsp
    305c:	c3                   	ret
