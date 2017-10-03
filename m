From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Tue, 3 Oct 2017 10:23:10 +0200
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
In-Reply-To: <20171003072703.GY6726@otheros>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
 <20171002234755.GA18646@ingrassia.epigenesys.com>
 <20171003072703.GY6726@otheros>
Message-ID: <20171003082310.GA15501@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Tue, Oct 03, 2017 at 09:27:03AM +0200, Linus L?ssing wrote:
> Hi Emiliano,
> 
> On Tue, Oct 03, 2017 at 01:47:55AM +0200, Emiliano Ingrassia wrote:
> > I executed the test listed by Linus in [0] on my Odroid-C1+, using a
> > clean 4.14-rc3 kernel with USB patch only (without the proposed patch).
> > All tests completed succesfully and I didn't experiment any hang.
> 
> Thanks for testing! Could you also try some memory related tests
> with stress-ng? For instance:
> 
> * stress-ng -v -t 120s --vm 4
> * stress-ng -v -t 120s --malloc 4
> * stress-ng -v -t 120s --bigheap 4
>

I just completed those tests succesfully. See [0].

> Does the OOM killer work for you there?
> 

It seems that OOM killer worked correctly [1].

> Cheers, Linus

Regards,

Emiliano

[0]:
~# stress-ng -v -t 120s --vm 4
stress-ng: debug: [429] 1 processor online, 4 processors configured
stress-ng: info:  [429] dispatching hogs: 4 vm
stress-ng: debug: [429] /sys/devices/system/cpu/cpu0/cache does not exist
stress-ng: info:  [429] cache allocate: using built-in defaults as unable to determine cache details
stress-ng: debug: [429] cache allocate: default cache size: 2048K
stress-ng: debug: [429] starting stressors
stress-ng: debug: [429] 4 stressors spawned
stress-ng: debug: [433] stress-ng-vm: started [433] (instance 3)
stress-ng: debug: [432] stress-ng-vm: started [432] (instance 2)
stress-ng: debug: [431] stress-ng-vm: started [431] (instance 1)
stress-ng: debug: [432] stress-ng-vm using method 'all'
stress-ng: debug: [430] stress-ng-vm: started [430] (instance 0)
stress-ng: debug: [433] stress-ng-vm using method 'all'
stress-ng: debug: [431] stress-ng-vm using method 'all'
stress-ng: debug: [430] stress-ng-vm using method 'all'
stress-ng: debug: [432] stress-ng-vm: exited [432] (instance 2)
stress-ng: debug: [431] stress-ng-vm: exited [431] (instance 1)
stress-ng: debug: [433] stress-ng-vm: exited [433] (instance 3)
stress-ng: debug: [430] stress-ng-vm: exited [430] (instance 0)
stress-ng: debug: [429] process [430] terminated
stress-ng: debug: [429] process [431] terminated
stress-ng: debug: [429] process [432] terminated
stress-ng: debug: [429] process [433] terminated
stress-ng: info:  [429] successful run completed in 120.07s (2 mins, 0.07 secs)
~# stress-ng -v -t 120s --malloc 4
stress-ng: debug: [438] 1 processor online, 4 processors configured
stress-ng: info:  [438] dispatching hogs: 4 malloc
stress-ng: debug: [438] /sys/devices/system/cpu/cpu0/cache does not exist
stress-ng: info:  [438] cache allocate: using built-in defaults as unable to determine cache details
stress-ng: debug: [438] cache allocate: default cache size: 2048K
stress-ng: debug: [438] starting stressors
stress-ng: debug: [438] 4 stressors spawned
stress-ng: debug: [442] stress-ng-malloc: started [442] (instance 3)
stress-ng: debug: [441] stress-ng-malloc: started [441] (instance 2)
stress-ng: debug: [440] stress-ng-malloc: started [440] (instance 1)
stress-ng: debug: [439] stress-ng-malloc: started [439] (instance 0)
stress-ng: debug: [442] stress-ng-malloc: exited [442] (instance 3)
stress-ng: debug: [441] stress-ng-malloc: exited [441] (instance 2)
stress-ng: debug: [440] stress-ng-malloc: exited [440] (instance 1)
stress-ng: debug: [439] stress-ng-malloc: exited [439] (instance 0)
stress-ng: debug: [438] process [439] terminated
stress-ng: debug: [438] process [440] terminated
stress-ng: debug: [438] process [441] terminated
stress-ng: debug: [438] process [442] terminated
stress-ng: info:  [438] successful run completed in 120.17s (2 mins, 0.17 secs)
~# stress-ng -v -t 120s --bigheap 4
stress-ng: debug: [447] 1 processor online, 4 processors configured
stress-ng: info:  [447] dispatching hogs: 4 bigheap
stress-ng: debug: [447] /sys/devices/system/cpu/cpu0/cache does not exist
stress-ng: info:  [447] cache allocate: using built-in defaults as unable to determine cache details
stress-ng: debug: [447] cache allocate: default cache size: 2048K
stress-ng: debug: [447] starting stressors
stress-ng: debug: [447] 4 stressors spawned
stress-ng: debug: [451] stress-ng-bigheap: started [451] (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: started [450] (instance 2)
stress-ng: debug: [449] stress-ng-bigheap: started [449] (instance 1)
stress-ng: debug: [448] stress-ng-bigheap: started [448] (instance 0)
stress-ng: debug: [448] stress-ng-bigheap: child died: signal 9 (Killed) (instance 0)
stress-ng: debug: [448] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 0)
stress-ng: debug: [456] stress-ng-bigheap: out of memory at 143616 MB (instance 0)
stress-ng: debug: [452] stress-ng-bigheap: out of memory at 1285632 MB (instance 2)
stress-ng: debug: [453] stress-ng-bigheap: out of memory at 1283072 MB (instance 3)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [456] stress-ng-bigheap: out of memory at 1104384 MB (instance 0)
stress-ng: debug: [452] stress-ng-bigheap: out of memory at 922880 MB (instance 2)
stress-ng: debug: [453] stress-ng-bigheap: out of memory at 890880 MB (instance 3)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 1087488 MB (instance 1)
stress-ng: debug: [456] stress-ng-bigheap: out of memory at 983552 MB (instance 0)
stress-ng: debug: [452] stress-ng-bigheap: out of memory at 1015552 MB (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 983552 MB (instance 1)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 1089024 MB (instance 3)
stress-ng: debug: [456] stress-ng-bigheap: out of memory at 979200 MB (instance 0)
stress-ng: debug: [452] stress-ng-bigheap: out of memory at 967424 MB (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 970496 MB (instance 1)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 993280 MB (instance 1)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 987136 MB (instance 3)
stress-ng: debug: [452] stress-ng-bigheap: out of memory at 1010688 MB (instance 2)
stress-ng: debug: [456] stress-ng-bigheap: out of memory at 1011712 MB (instance 0)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 991488 MB (instance 3)
stress-ng: debug: [452] stress-ng-bigheap: out of memory at 1001728 MB (instance 2)
stress-ng: debug: [456] stress-ng-bigheap: out of memory at 989440 MB (instance 0)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 1021696 MB (instance 1)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 987392 MB (instance 1)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 996608 MB (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 628992 MB (instance 1)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 646912 MB (instance 3)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 786688 MB (instance 2)
stress-ng: debug: [448] stress-ng-bigheap: child died: signal 9 (Killed) (instance 0)
stress-ng: debug: [448] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 0)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 983552 MB (instance 2)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 997888 MB (instance 3)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 991744 MB (instance 1)
stress-ng: debug: [448] stress-ng-bigheap: child died: signal 9 (Killed) (instance 0)
stress-ng: debug: [448] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 0)
stress-ng: debug: [458] stress-ng-bigheap: out of memory at 965888 MB (instance 3)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 973568 MB (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 963328 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1102080 MB (instance 0)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 983552 MB (instance 0)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 1008384 MB (instance 1)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 992512 MB (instance 2)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 945920 MB (instance 1)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 961792 MB (instance 2)
stress-ng: debug: [462] stress-ng-bigheap: out of memory at 1118464 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 978432 MB (instance 0)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 994816 MB (instance 1)
stress-ng: debug: [462] stress-ng-bigheap: out of memory at 988416 MB (instance 3)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 1010688 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1010944 MB (instance 0)
stress-ng: debug: [462] stress-ng-bigheap: out of memory at 1001472 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1001984 MB (instance 0)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 1012992 MB (instance 1)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 989184 MB (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 992512 MB (instance 1)
stress-ng: debug: [462] stress-ng-bigheap: out of memory at 990720 MB (instance 3)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 1009152 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1011200 MB (instance 0)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 987904 MB (instance 0)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 1001728 MB (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 1004032 MB (instance 1)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 975616 MB (instance 2)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 976384 MB (instance 1)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 1090304 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 963840 MB (instance 0)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 983296 MB (instance 3)
stress-ng: debug: [457] stress-ng-bigheap: out of memory at 1002496 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1007360 MB (instance 0)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 1009152 MB (instance 2)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 987136 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 994560 MB (instance 0)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 1011200 MB (instance 3)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [459] stress-ng-bigheap: out of memory at 966400 MB (instance 2)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 962560 MB (instance 3)
stress-ng: debug: [464] stress-ng-bigheap: out of memory at 1113344 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 964096 MB (instance 0)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 999680 MB (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [466] stress-ng-bigheap: out of memory at 493056 MB (instance 2)
stress-ng: debug: [464] stress-ng-bigheap: out of memory at 1588992 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1631232 MB (instance 0)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 293376 MB (instance 3)
stress-ng: debug: [464] stress-ng-bigheap: out of memory at 910336 MB (instance 1)
stress-ng: debug: [466] stress-ng-bigheap: out of memory at 1089792 MB (instance 2)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 1120000 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 884992 MB (instance 0)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 983552 MB (instance 0)
stress-ng: debug: [466] stress-ng-bigheap: out of memory at 988416 MB (instance 2)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 989952 MB (instance 3)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 1121792 MB (instance 1)
stress-ng: debug: [466] stress-ng-bigheap: out of memory at 959744 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 959488 MB (instance 0)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 964608 MB (instance 3)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 991488 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1011200 MB (instance 0)
stress-ng: debug: [466] stress-ng-bigheap: out of memory at 993280 MB (instance 2)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 1008128 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 987136 MB (instance 0)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 1012992 MB (instance 1)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 991744 MB (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 957696 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 958976 MB (instance 0)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 1106176 MB (instance 2)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 983296 MB (instance 3)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 994048 MB (instance 2)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 1007104 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 999168 MB (instance 0)
stress-ng: debug: [463] stress-ng-bigheap: out of memory at 1003776 MB (instance 3)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 998656 MB (instance 1)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 1008128 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 986368 MB (instance 0)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 968448 MB (instance 0)
stress-ng: debug: [467] stress-ng-bigheap: out of memory at 966656 MB (instance 1)
stress-ng: debug: [469] stress-ng-bigheap: out of memory at 1117952 MB (instance 3)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 953088 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1008896 MB (instance 0)
stress-ng: debug: [469] stress-ng-bigheap: out of memory at 991744 MB (instance 3)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 983296 MB (instance 2)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 960000 MB (instance 0)
stress-ng: debug: [469] stress-ng-bigheap: out of memory at 962048 MB (instance 3)
stress-ng: debug: [470] stress-ng-bigheap: out of memory at 1115648 MB (instance 1)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 967936 MB (instance 2)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 1014784 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 992512 MB (instance 0)
stress-ng: debug: [470] stress-ng-bigheap: out of memory at 983808 MB (instance 1)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 1101056 MB (instance 3)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 963840 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 968448 MB (instance 0)
stress-ng: debug: [470] stress-ng-bigheap: out of memory at 972544 MB (instance 1)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 987136 MB (instance 3)
stress-ng: debug: [470] stress-ng-bigheap: out of memory at 997376 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1009408 MB (instance 0)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 1011200 MB (instance 2)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 957184 MB (instance 2)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [468] stress-ng-bigheap: out of memory at 325632 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1556736 MB (instance 0)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 1662976 MB (instance 3)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 461056 MB (instance 1)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1112064 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 902144 MB (instance 0)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 876032 MB (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 980736 MB (instance 3)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 939264 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 983296 MB (instance 0)
stress-ng: debug: [473] stress-ng-bigheap: out of memory at 1102080 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 993280 MB (instance 0)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1009152 MB (instance 1)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 1019392 MB (instance 3)
stress-ng: debug: [473] stress-ng-bigheap: out of memory at 983296 MB (instance 2)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 986880 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1008640 MB (instance 0)
stress-ng: debug: [473] stress-ng-bigheap: out of memory at 995584 MB (instance 2)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1012480 MB (instance 1)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 1004800 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 986368 MB (instance 0)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1004544 MB (instance 1)
stress-ng: debug: [473] stress-ng-bigheap: out of memory at 1010688 MB (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [474] stress-ng-bigheap: out of memory at 151040 MB (instance 2)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 1293312 MB (instance 3)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1291008 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1270016 MB (instance 0)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 948224 MB (instance 0)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 951552 MB (instance 1)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 958720 MB (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 976384 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 971776 MB (instance 0)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 1091840 MB (instance 2)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 966144 MB (instance 3)
stress-ng: debug: [471] stress-ng-bigheap: out of memory at 990976 MB (instance 3)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 988416 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1010944 MB (instance 0)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1012224 MB (instance 1)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 1007616 MB (instance 2)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 997888 MB (instance 1)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1942784 MB (instance 0)
stress-ng: debug: [476] stress-ng-bigheap: out of memory at 786688 MB (instance 3)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 638720 MB (instance 1)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 637696 MB (instance 2)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1042176 MB (instance 1)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 1039616 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 865280 MB (instance 0)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 958464 MB (instance 1)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 1108736 MB (instance 3)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 983296 MB (instance 0)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 954880 MB (instance 2)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 1011456 MB (instance 0)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 994816 MB (instance 2)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 983552 MB (instance 3)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1013760 MB (instance 1)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 1011712 MB (instance 3)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 987392 MB (instance 2)
stress-ng: debug: [472] stress-ng-bigheap: out of memory at 1012480 MB (instance 1)
stress-ng: debug: [461] stress-ng-bigheap: out of memory at 994560 MB (instance 0)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 1008384 MB (instance 2)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 1002752 MB (instance 3)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 628224 MB (instance 3)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 623872 MB (instance 2)
stress-ng: debug: [478] stress-ng-bigheap: out of memory at 786944 MB (instance 1)
stress-ng: debug: [448] stress-ng-bigheap: child died: signal 9 (Killed) (instance 0)
stress-ng: debug: [448] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 0)
stress-ng: debug: [478] stress-ng-bigheap: out of memory at 983296 MB (instance 1)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 985600 MB (instance 2)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 983296 MB (instance 3)
stress-ng: debug: [448] stress-ng-bigheap: child died: signal 9 (Killed) (instance 0)
stress-ng: debug: [448] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 0)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 972288 MB (instance 3)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 962560 MB (instance 2)
stress-ng: debug: [478] stress-ng-bigheap: out of memory at 979200 MB (instance 1)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 1091328 MB (instance 0)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 1003264 MB (instance 2)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 1001984 MB (instance 0)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 994816 MB (instance 3)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [481] stress-ng-bigheap: out of memory at 1093376 MB (instance 1)
stress-ng: debug: [475] stress-ng-bigheap: out of memory at 963840 MB (instance 2)
stress-ng: debug: [477] stress-ng-bigheap: out of memory at 974080 MB (instance 3)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 974592 MB (instance 0)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [482] stress-ng-bigheap: out of memory at 170752 MB (instance 3)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 1280768 MB (instance 0)
stress-ng: debug: [481] stress-ng-bigheap: out of memory at 1272576 MB (instance 1)
stress-ng: debug: [450] stress-ng-bigheap: child died: signal 9 (Killed) (instance 2)
stress-ng: debug: [450] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 2)
stress-ng: debug: [481] stress-ng-bigheap: out of memory at 898304 MB (instance 1)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [484] stress-ng-bigheap: out of memory at 514304 MB (instance 3)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 1506048 MB (instance 0)
stress-ng: debug: [481] stress-ng-bigheap: out of memory at 374272 MB (instance 1)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 1610496 MB (instance 2)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 901632 MB (instance 2)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 924160 MB (instance 0)
stress-ng: debug: [484] stress-ng-bigheap: out of memory at 1081344 MB (instance 3)
stress-ng: debug: [449] stress-ng-bigheap: child died: signal 9 (Killed) (instance 1)
stress-ng: debug: [449] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 1)
stress-ng: debug: [485] stress-ng-bigheap: out of memory at 1114880 MB (instance 1)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 981760 MB (instance 0)
stress-ng: debug: [484] stress-ng-bigheap: out of memory at 928000 MB (instance 3)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 980992 MB (instance 2)
stress-ng: debug: [485] stress-ng-bigheap: out of memory at 983296 MB (instance 1)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 1007616 MB (instance 2)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 989440 MB (instance 0)
stress-ng: debug: [484] stress-ng-bigheap: out of memory at 1024000 MB (instance 3)
stress-ng: debug: [484] stress-ng-bigheap: out of memory at 986112 MB (instance 3)
stress-ng: debug: [485] stress-ng-bigheap: out of memory at 996864 MB (instance 1)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 1011456 MB (instance 2)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 1011456 MB (instance 0)
stress-ng: debug: [451] stress-ng-bigheap: child died: signal 9 (Killed) (instance 3)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 975104 MB (instance 2)
stress-ng: debug: [451] stress-ng-bigheap: assuming killed by OOM killer, restarting again (instance 3)
stress-ng: debug: [485] stress-ng-bigheap: out of memory at 1608704 MB (instance 1)
stress-ng: debug: [486] stress-ng-bigheap: out of memory at 478720 MB (instance 3)
stress-ng: debug: [480] stress-ng-bigheap: out of memory at 1605888 MB (instance 0)
stress-ng: debug: [483] stress-ng-bigheap: out of memory at 312832 MB (instance 2)
stress-ng: debug: [451] stress-ng-bigheap: OOM restarts: 10, SEGV restarts: 0, out of memory restarts: 0.
stress-ng: debug: [450] stress-ng-bigheap: OOM restarts: 7, SEGV restarts: 0, out of memory restarts: 0.
stress-ng: debug: [451] stress-ng-bigheap: exited [451] (instance 3)
stress-ng: debug: [450] stress-ng-bigheap: exited [450] (instance 2)
stress-ng: debug: [448] stress-ng-bigheap: OOM restarts: 5, SEGV restarts: 0, out of memory restarts: 0.
stress-ng: debug: [448] stress-ng-bigheap: exited [448] (instance 0)
stress-ng: debug: [447] process [448] terminated
stress-ng: debug: [449] stress-ng-bigheap: OOM restarts: 8, SEGV restarts: 0, out of memory restarts: 0.
stress-ng: debug: [449] stress-ng-bigheap: exited [449] (instance 1)
stress-ng: debug: [447] process [449] terminated
stress-ng: debug: [447] process [450] terminated
stress-ng: debug: [447] process [451] terminated
stress-ng: info:  [447] successful run completed in 120.13s (2 mins, 0.13 secs)
~#

[1]:
[  477.065321] stress-ng-bighe invoked oom-killer: gfp_mask=0x14201ca(GFP_HIGHUSER_MOVABLE|__GFP_COLD), nodemask=(null),  order=0, oom_score_adj=1000
[  477.065350] CPU: 0 PID: 484 Comm: stress-ng-bighe Not tainted 4.14.0-rc3+ #1
[  477.065353] Hardware name: Amlogic Meson platform
[  477.065386] [<c010f18c>] (unwind_backtrace) from [<c010c4e8>] (show_stack+0x10/0x14)
[  477.065406] [<c010c4e8>] (show_stack) from [<c0597224>] (dump_stack+0x94/0xa8)
[  477.065424] [<c0597224>] (dump_stack) from [<c01b3804>] (dump_header+0x90/0x1c8)
[  477.065435] [<c01b3804>] (dump_header) from [<c01b2ff8>] (oom_kill_process+0x3f8/0x484)
[  477.065444] [<c01b2ff8>] (oom_kill_process) from [<c01b33c4>] (out_of_memory+0xfc/0x42c)
[  477.065456] [<c01b33c4>] (out_of_memory) from [<c01b7b5c>] (__alloc_pages_nodemask+0xcac/0xdd4)
[  477.065466] [<c01b7b5c>] (__alloc_pages_nodemask) from [<c01afbac>] (filemap_fault+0x4d8/0x600)
[  477.065478] [<c01afbac>] (filemap_fault) from [<c0286134>] (ext4_filemap_fault+0x28/0x3c)
[  477.065495] [<c0286134>] (ext4_filemap_fault) from [<c01d54b4>] (__do_fault+0x18/0x64)
[  477.065508] [<c01d54b4>] (__do_fault) from [<c01d82cc>] (handle_mm_fault+0x540/0xe5c)
[  477.065525] [<c01d82cc>] (handle_mm_fault) from [<c0113698>] (do_page_fault+0x244/0x310)
[  477.065538] [<c0113698>] (do_page_fault) from [<c01013b0>] (do_PrefetchAbort+0x44/0xbc)
[  477.065547] [<c01013b0>] (do_PrefetchAbort) from [<c010d748>] (ret_from_exception+0x0/0x18)
[  477.065551] Exception stack(0xee5fffb0 to 0xee5ffff8)
[  477.065559] ffa0:                                     10400028 00020000 fffff000 00021000
[  477.065568] ffc0: 001a9bd0 10400008 ae200010 ae200468 ae200000 10401000 001aa0b8 00020b98
[  477.065575] ffe0: 00000000 bed4bf38 000d52a8 000d3858 200f0010 ffffffff
[  477.065585] Mem-Info:
[  477.065602] active_anon:251474 inactive_anon:700 isolated_anon:0
                active_file:24 inactive_file:35 isolated_file:0
                unevictable:4 dirty:0 writeback:0 unstable:0
                slab_reclaimable:440 slab_unreclaimable:908
                mapped:540 shmem:707 pagetables:634 bounce:0
                free:2679 free_pcp:115 free_cma:37
[  477.065614] Node 0 active_anon:1005896kB inactive_anon:2800kB active_file:96kB inactive_file:140kB unevictable:16kB isolated(anon):0kB isolated(file):0kB mapped:2160kB dirty:0kB writeback:0kB shmem:2828kB writeback_tmp:0kB unstable:0ko
[  477.065631] Normal free:10568kB min:3504kB low:4380kB high:5256kB active_anon:747400kB inactive_anon:0kB active_file:100kB inactive_file:212kB unevictable:0kB writepending:0kB present:786432kB managed:769308kB mlocked:0kB kernel_stackB
[  477.065633] lowmem_reserve[]: 0 1856 1856
[  477.065654] HighMem free:148kB min:232kB low:500kB high:768kB active_anon:258496kB inactive_anon:2800kB active_file:4kB inactive_file:0kB unevictable:16kB writepending:0kB present:262144kB managed:262144kB mlocked:16kB kernel_stack:0kB
[  477.065656] lowmem_reserve[]: 0 0 0
[  477.065665] Normal: 70*4kB (UME) 60*8kB (UME) 39*16kB (UE) 15*32kB (ME) 12*64kB (E) 8*128kB (UE) 3*256kB (UE) 4*512kB (UE) 2*1024kB (UM) 1*2048kB (E) 0*4096kB = 10568kB
[  477.065717] HighMem: 1*4kB (C) 0*8kB 1*16kB (C) 0*32kB 0*64kB 1*128kB (C) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 148kB
[  477.065753] 777 total pagecache pages
[  477.065756] 262144 pages RAM
[  477.065758] 65536 pages HighMem/MovableOnly
[  477.065761] 4281 pages reserved
[  477.065763] 6144 pages cma reserved
[  477.065767] [ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds swapents oom_score_adj name
[  477.065781] [  120]     0   120     2945      246       7       0        0         -1000 udevd
[  477.065788] [  232]     0   232      507       24       5       0        0             0 syslogd
[  477.065795] [  236]     0   236      472       16       5       0        0             0 klogd
[  477.065807] [  388]     0   388      593       26       5       0        0             0 crond
[  477.065814] [  396]     0   396      678       25       6       0        0             0 agetty
[  477.065821] [  397]     0   397      678       25       5       0        0             0 agetty
[  477.065828] [  398]     0   398      678       25       6       0        0             0 agetty
[  477.065835] [  399]     0   399      678       25       6       0        0             0 agetty
[  477.065842] [  400]     0   400      678       25       5       0        0             0 agetty
[  477.065848] [  401]     0   401      678       25       7       0        0             0 agetty
[  477.065855] [  402]     0   402     1336      136       7       0        0             0 bash
[  477.065863] [  447]     0   447     2598      552       9       0        0         -1000 stress-ng
[  477.065870] [  448]     0   448     2598       30       8       0        0         -1000 stress-ng-bighe
[  477.065878] [  449]     0   449     2598       30       8       0        0         -1000 stress-ng-bighe
[  477.065885] [  450]     0   450     2598       30       8       0        0         -1000 stress-ng-bighe
[  477.065893] [  451]     0   451     2598       30       8       0        0         -1000 stress-ng-bighe
[  477.065900] [  480]     0   480    64295    61500     129       0        0          1000 stress-ng-bighe
[  477.065907] [  483]     0   483    63783    60988     128       0        0          1000 stress-ng-bighe
[  477.065915] [  484]     0   484    69399    66573     138       0        0          1000 stress-ng-bighe
[  477.065922] [  485]     0   485    64295    61500     129       0        0          1000 stress-ng-bighe
[  477.065932] Out of memory: Kill process 484 (stress-ng-bighe) score 1247 or sacrifice child
[  477.065949] Killed process 484 (stress-ng-bighe) total-vm:277596kB, anon-rss:266284kB, file-rss:0kB, shmem-rss:8kB
[  477.185388] oom_reaper: reaped process 484 (stress-ng-bighe), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
