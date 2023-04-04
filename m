Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B157C761A6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czZC+AUmYmcxa1qJ41gIbQzY7BxVWsXNZu/Fr8RnfWw=; b=npNZw8SAxZd7Z07/Zaa46u1mES
	k3EvTj1ZKZNaTqZwE3dL1jUNxu3C+flzMalVW9hC2uqAbT04vcOO+QmsifhOOUM3qEm2k34PNJueV
	ByQ9YQahIJC22jUptvHItY7cxX9SwCXR7Jrc0lfZiq/IlkzE6qZuizGK+Z8AO8z2qQV2hs0ZqmHY7
	PKt5kkoA3fSkLfa2XRvt06luK5cZmwAWKPKnPnrpsiYNap3U/ufZdGW2KWHocyql2urulWHpJsfY2
	1Urs7KhLqSQzXCRNkccCcibcd+fg7qwoIAGrfb7zv1tDkwqO0smhrRFo05LJp3AI09jXYp91pWABn
	WH53GPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgq3-001TyZ-0j;
	Tue, 04 Apr 2023 13:36:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgpz-001TxZ-2o
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 13:36:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id l12so32819274wrm.10
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Apr 2023 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680615396;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yhegLTyuvukccnhCpMJZ+0sUZ06qb3Y4pXQ/qsHKzgg=;
        b=An30+yDzFn6VqA4jWqk5c9hywdY9zg8MWDTOrdF0c6HgggHvfYngVs9PyZxvD6U2xf
         G0VZ/85FeGnAGkiByU6/QONVNAccVgLES73GDNH5JbGhF9amCFXG5zLVRKmbMh+ek+ct
         bz+7u6NRawpezfIu0RvPF/sa+ydMWr61h86tHRlk3cjy/svuOwyOOlKddNwxCt+RLhCp
         dMBO03JSPVtAqoV5kKcvjzmCrUuVa2loHLAKYlJyKCu7rsW5sXflAauIc8SKQO4LDHVJ
         ecoDz5enR9KdG/b/Phm+Bh2AxZbS8jTO/aL0XoTyWJ9mAxksJxhRXghDOam0HVtQb0GE
         KWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615396;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhegLTyuvukccnhCpMJZ+0sUZ06qb3Y4pXQ/qsHKzgg=;
        b=J24zP8Yjl/iERthG6hEShbyoCAzcX3hoH+1TxVenbe4DXqZMFAK64SHm4CiWvqTehn
         bG0x0xsM0Cfie2LQcT1y2Ci00LpXjLGj7bKKTO16fIGbqnAApbYPKyBxc2WPflMo8hzY
         MrQTOAadL663jd0cIIQotCH+bwR28VQKOS5trwjUbLN4LLptLVS+qBEvV9sojjzPvFQY
         doOzYBEif63nByo+li/kQ1usi+JU+vdfKNN4DgNmKcbjNcQegn+HA4MrW8hEbDlfQqsa
         FqGmt/966+EkrmUex7dFKcQyM8VFUrhPFKF9uS6kt92CkZ2AG/z68D3ph9765nvVs80U
         2L4Q==
X-Gm-Message-State: AAQBX9eCWtmPAkiiSjC5RGzevWrHCrL9fnzkkH6gKw6f82Yg8I5UwVK2
	McWY42Px3GQ3yA6vaU+FCYMz8JYP2MDrhfAFMJLdlA==
X-Google-Smtp-Source: AKy350auqDcnMSCSZhbgtZhiMrXE2iMFHWiaGadvQWzET+3qbwhme/UYsym82zSKWKW5XJkAE1Eljg==
X-Received: by 2002:a5d:53c2:0:b0:2c7:d6a:d7fa with SMTP id a2-20020a5d53c2000000b002c70d6ad7famr1825775wrw.25.1680615395852;
        Tue, 04 Apr 2023 06:36:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003ede6540190sm22932256wmq.0.2023.04.04.06.36.35
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 06:36:35 -0700 (PDT)
Message-ID: <3d5980b4-670d-0d13-f74e-e689d37ca653@linaro.org>
Date: Tue, 4 Apr 2023 15:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RESEND] Throughput & CPU usage of WiFi download
Content-Language: en-US
To: linux-amlogic@lists.infradead.org
References: <cbbd4a70-850d-cd1e-9809-1d115378fe09@free.fr>
 <f2344e2e-2b53-9f57-d15a-25e5b03b3029@free.fr>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <f2344e2e-2b53-9f57-d15a-25e5b03b3029@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_063639_921906_571500A4 
X-CRM114-Status: GOOD (  18.41  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/04/2023 14:54, Marc Gonzalez wrote:
> [ Re-sending, because gmail blocks messages with img extension, even within archives
>    Great job Microsoft for inferring file type based on file extension... ]
> 
> Hello everyone,
> 
> I've been benchmarking various aspects of an SEI530 board,
> and wanted to share some of the results with the list.
> 
> The main objective was to compare WiFi download performance
> on mainline/BR2 and vendor/android systems.
> 
> (Mainline system was generated using pop-br2-ext-tree.zip.
> brcmfmac4359-sdio.* left out for size.)
> 
> https://pixeldrain.com/u/qH3YotXP
> 
> 
> HW spec
> Board: SEI530 (SEI510 variant)
> SoC: S905X2
> WiFi: AP6398SR3-J (SDIO BCM4359/9)
> 
> Test setup
> WiFi AP using 5Ghz channels 120 (primary) + 116 (secondary)
> BENCHMARK = "curl --silent -o /dev/null http://192.168.1.254:8095/fixed/10G"
> Kernel booted with
> 1) performance governor (no DVFS)
> 2) nohlt (keep counting cycles in idle)
> 
> 
> (Full results at the end)
> 
> Observations:
> - vendor system manages 245 Mbps, using 40% CPU
> - mainline system manages 60 Mbps, using 10% CPU
> - vendor system limited to 62 Mbps, uses 9% CPU
> 
> 1) Neil Armstrong mentioned that vendor kernel reaches
> higher throughput by playing tricks with some pads?
> (Not sure I understood that well, haven't looked at the code)

Vendor kernel uses the SDCard controller by swapping the SDIO lines,
so they use a fully functional controller unlike mainline.

And you should use the same Vendor BCMDHD driver on mainelin.

So the comparison isn't fair.

> 
> 2) SDIO is clocked higher on vendor system, but could
> lead to instabilities on some boards?
> 
> Interesting possible followups
> - try clocking SDIO higher on mainline system
> - measure CPU usage at 120 Mbps, does it scale linearly to 20%?
> - android curl seems to use smaller buffers?
> 
> 
> TEST RESULTS
> 
> -- mainline/BR2 (v6.2)
> 
> time perf record -a -F 1009 $BENCHMARK
> perf report -s pid -n --header
> 
> 10_GB in 1338.127552_s = 59.8_Mbps
> 
> # Overhead       Samples      Pid:Command
>    90.0445%       4863024        0:swapper = IDLE
>     7.2362%        390807       56:irq/17-ffe03000
>     1.9282%        104136       59:kworker/u9:0-br
>     0.6965%         37616      142:curl
>     0.0722%          3897      114:ksdioirqd/mmc2
>     0.0168%           908      141:perf
> 
> 
> -- vendor/android (4.9.180 + vendor patches)
> 
> time simpleperf record -a -f 1009 $BENCHMARK
> simpleperf report --sort pid,comm
> 
> 10_GB in 326.54_s = 245_Mbps
> 
> Overhead  Sample  Pid    Command
> 59.43%    680339  0      swapper = IDLE
> 12.59%    156593  15378  curl
> 11.42%    136024  4392   dhd_rxf
> 7.57%     88047   4391   dhd_dpc
> 2.52%     29977   2094   irq/51-meson-am
> 1.38%     16467   10541  system_server
> 0.75%     10394   17     ksoftirqd/1
> 0.73%     9282    15377  simpleperf
> 0.60%     9226    6      ksoftirqd/0
> 0.38%     4701    14865  kworker/0:0
> 0.14%     2055    29     ksoftirqd/3
> 0.13%     1636    3411   HwBinder:3411_1
> 0.13%     1760    23     ksoftirqd/2
> 0.12%     1484    10782  dmx_data_thread
> 0.12%     1469    3381   composer@2.3-se
> 0.10%     1329    15425  Jit thread pool
> 
> 
> Same benchmark, rate limited to 8 MB/s
> time simpleperf record -a -f 1009 $BENCHMARK --limit-rate 8M
> simpleperf report --sort pid,comm
> 
> 10_GB in 1290.22_s = 62 Mbps
> 
> Overhead  Sample   Pid    Command
> 91.68%    3687632  0      swapper = IDLE
> 2.67%     107057   4392   dhd_rxf
> 1.90%     74721    4391   dhd_dpc
> 1.00%     41650    22975  curl
> 0.70%     29239    10541  system_server
> 0.68%     27406    2094   irq/51-meson-am
> 0.58%     24781    22974  simpleperf
> 0.10%     4222     17     ksoftirqd/1
> 0.10%     4070     10782  dmx_data_thread
> 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
