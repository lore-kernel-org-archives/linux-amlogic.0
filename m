Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D2FC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YyPHraC+LS7Acrk9heI9bhtoIUxBOxzp78t1nvHtlM=; b=PgytUjU+67/xU4
	9HI6WtRyYYlGdAtbbhwvW1D8bRgSXNOv3fc/oGsNBb8xHHZcLWMXSZ9GDFGUUixUtidoILnM7ALlD
	R8B4cawTJsHhAfmjEQrlOnj1BdocadzLKJrOeZT7hd/NQNBjqJlDvH+EZp0TgPFMnjW0w0TXeYLWk
	lc8VSf6YK7BVgpTQwiClUYtP4sdy/YZJmIdSep0PLSsTC9k3x6kAt3YvaczdWz/3FKBnWw6gm7QW1
	CTX/o8CUpkWkiESBXmmiYwURiEA96/eD700+QQOqZ5DautVMV35mptbMx7sHANreVUzB1PBEMA1sA
	WiZjFMumbvtL0gaF3udg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgfa-001SAN-2a;
	Tue, 04 Apr 2023 13:25:54 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgBc-001MaX-3A
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 12:54:58 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 777CA2003DE;
	Tue,  4 Apr 2023 14:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680612894;
	bh=S+/zNTMxl4YfEZerK9buqZZCEV+VNnXIqXHpKvSSZd0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sOR0MeTDGejKoVMBzlmAIJBzcQ/J59USt8gyT1MunDeacW6XUewYwYSgmQDwEcNrS
	 tCJBgEBSbVZXK3tgMIG8L2i3zdKAaX2RR9UwYxaqzN6M2F5WjEifmrXbQnJFsT4MHW
	 CsRBz86/Szk3gFwymP4QuxI+w26d8P6fTOYAEiqnsCyUJWJ9DCLbuNYwjVHutSJHti
	 JYvEGo17NJYWFXSDdDmMMMnfz27E3mPkRus9QWT1wH2/Y1S6uFwNa0fZC8BjR1ST/f
	 TrZToUOHv71kbXLyxnpKn0C8QsshDxZXVw6wds3RK70PYr0U0hNYHHB65/w1lwWguY
	 Ql2TUDFnldnqg==
Message-ID: <f2344e2e-2b53-9f57-d15a-25e5b03b3029@free.fr>
Date: Tue, 4 Apr 2023 14:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [RESEND] Throughput & CPU usage of WiFi download
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: linux-amlogic@lists.infradead.org, linux-wireless@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin
 <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>,
 Pierre-Hugues Husson <phh@phh.me>, Arnaud Vrac <avrac@freebox.fr>
References: <cbbd4a70-850d-cd1e-9809-1d115378fe09@free.fr>
In-Reply-To: <cbbd4a70-850d-cd1e-9809-1d115378fe09@free.fr>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_055457_167880_64189FA1 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 04 Apr 2023 06:25:54 -0700
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[ Re-sending, because gmail blocks messages with img extension, even within archives
  Great job Microsoft for inferring file type based on file extension... ]

Hello everyone,

I've been benchmarking various aspects of an SEI530 board,
and wanted to share some of the results with the list.

The main objective was to compare WiFi download performance
on mainline/BR2 and vendor/android systems.

(Mainline system was generated using pop-br2-ext-tree.zip.
brcmfmac4359-sdio.* left out for size.)

https://pixeldrain.com/u/qH3YotXP


HW spec
Board: SEI530 (SEI510 variant)
SoC: S905X2
WiFi: AP6398SR3-J (SDIO BCM4359/9)

Test setup
WiFi AP using 5Ghz channels 120 (primary) + 116 (secondary)
BENCHMARK = "curl --silent -o /dev/null http://192.168.1.254:8095/fixed/10G"
Kernel booted with
1) performance governor (no DVFS)
2) nohlt (keep counting cycles in idle)


(Full results at the end)

Observations:
- vendor system manages 245 Mbps, using 40% CPU
- mainline system manages 60 Mbps, using 10% CPU
- vendor system limited to 62 Mbps, uses 9% CPU

1) Neil Armstrong mentioned that vendor kernel reaches
higher throughput by playing tricks with some pads?
(Not sure I understood that well, haven't looked at the code)

2) SDIO is clocked higher on vendor system, but could
lead to instabilities on some boards?

Interesting possible followups
- try clocking SDIO higher on mainline system
- measure CPU usage at 120 Mbps, does it scale linearly to 20%?
- android curl seems to use smaller buffers?


TEST RESULTS

-- mainline/BR2 (v6.2)

time perf record -a -F 1009 $BENCHMARK
perf report -s pid -n --header

10_GB in 1338.127552_s = 59.8_Mbps

# Overhead       Samples      Pid:Command
  90.0445%       4863024        0:swapper = IDLE
   7.2362%        390807       56:irq/17-ffe03000
   1.9282%        104136       59:kworker/u9:0-br
   0.6965%         37616      142:curl
   0.0722%          3897      114:ksdioirqd/mmc2
   0.0168%           908      141:perf


-- vendor/android (4.9.180 + vendor patches)

time simpleperf record -a -f 1009 $BENCHMARK
simpleperf report --sort pid,comm

10_GB in 326.54_s = 245_Mbps

Overhead  Sample  Pid    Command
59.43%    680339  0      swapper = IDLE
12.59%    156593  15378  curl
11.42%    136024  4392   dhd_rxf
7.57%     88047   4391   dhd_dpc
2.52%     29977   2094   irq/51-meson-am
1.38%     16467   10541  system_server
0.75%     10394   17     ksoftirqd/1
0.73%     9282    15377  simpleperf
0.60%     9226    6      ksoftirqd/0
0.38%     4701    14865  kworker/0:0
0.14%     2055    29     ksoftirqd/3
0.13%     1636    3411   HwBinder:3411_1
0.13%     1760    23     ksoftirqd/2
0.12%     1484    10782  dmx_data_thread
0.12%     1469    3381   composer@2.3-se
0.10%     1329    15425  Jit thread pool


Same benchmark, rate limited to 8 MB/s
time simpleperf record -a -f 1009 $BENCHMARK --limit-rate 8M
simpleperf report --sort pid,comm

10_GB in 1290.22_s = 62 Mbps

Overhead  Sample   Pid    Command
91.68%    3687632  0      swapper = IDLE
2.67%     107057   4392   dhd_rxf
1.90%     74721    4391   dhd_dpc
1.00%     41650    22975  curl
0.70%     29239    10541  system_server
0.68%     27406    2094   irq/51-meson-am
0.58%     24781    22974  simpleperf
0.10%     4222     17     ksoftirqd/1
0.10%     4070     10782  dmx_data_thread



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
