Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72449C77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elLeOsKIqVhxJy3/qTByDqwtt4iZuE+nEFxJEzRydMc=; b=28g/n3zKtpUk/N
	XV+2qvk9OnlWQZ2SvxhSTjXEBUgINBDVyFDWCcgdidH65SWzvZW7X2yW9ktCHfmR9EaUjk1SGGA9R
	ImZXDxJumW3EK9JxqWxsgmVrfqL7jtSaW739no2810wiklF14Z+jIa7upHZ82ccKq8DWWr5kyo47C
	B5DGoEqzyTeymkefenY3nfM1G3SUrRA8CIDGejg/f74R+gfRMgu83+rS0nFIzDlodPhToRSWW9wLe
	T1P5WJ7G+1n9WZ4Xr3cU4xkz0w9mvS3I9WQQR6gRoryA4VXLnqVEfdYgcN4FZG3ToSjfPWEkBiH/c
	o2d5ubKj4c4JLAh7ztYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPkv-00GbkB-1R;
	Mon, 17 Apr 2023 14:22:57 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPks-00Gbhx-2A
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Apr 2023 14:22:56 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3EFC1200408;
	Mon, 17 Apr 2023 16:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1681741368;
	bh=kTItlP2YI88NnNFYbognrrCdZc5bTlLjB1ZMOm34g6U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=MsSERrn9h14PSHh54N2ikHlA+O74JGfn36OIedPCdtTmuMqOnBVBAAsLewloQRRCe
	 rrpRlg2tSOtadjkCAj2ew+lRBDyk1YeRiAqg/wHArTL9vMqeERTfowuhsHCLXSJoOQ
	 xHv9cLQjw5pSUPmN7/qHUyQLijPOBwGpB+uVsBopNA8nDFexILcm0+56twRPvvOc1S
	 GAX6FyFjz1sE/PSzriMkUKtDcMFOZ4s9zZGd+nJ2oyKNbm5LNAWkEalID9QYNDxc+m
	 VQgfGbtQg/cAkIfN6hWw/UrH40uaUB/yqW20LzE908hom1sUa+j39Ww/OFDM7VFoDk
	 pjSk2EQJOj0Fg==
Message-ID: <ac5d9c2e-13c3-7f99-a20c-d857282c6451@free.fr>
Date: Mon, 17 Apr 2023 16:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Performance regression] BCM4359/9 on S905X2
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: AML <linux-amlogic@lists.infradead.org>
Cc: Martin Blumenstingl <martin.blumenstingl@gmail.com>,
 Christian Hewitt <christian@hewittfamily.org.uk>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 MMC <linux-mmc@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Pierre-Hugues Husson <phh@phh.me>
References: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
 <1jh6ue74x9.fsf@starbuckisacylon.baylibre.com>
 <EEE9FD80-C106-4A9B-AA8D-5C151E540CFD@hewittfamily.org.uk>
 <0bb1e3b3-6823-ddb5-001b-72ee1b63779c@free.fr>
 <CAFBinCA+JOxCGzML-Mohryawrn6Vghd8Ns22=2ZfvWov43aeEg@mail.gmail.com>
 <74feca6f-4177-5645-6614-bc5f3dbf0be1@free.fr>
In-Reply-To: <74feca6f-4177-5645-6614-bc5f3dbf0be1@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_072255_168839_C524DDF3 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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

On 06/04/2023 18:35, Marc Gonzalez wrote:

> # curl -o /dev/null http://192.168.1.254:8095/fixed/1G
>   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
>                                  Dload  Upload   Total   Spent    Left  Speed
> 100 1024M  100 1024M    0     0  9747k      0  0:01:47  0:01:47 --:--:-- 9544k

I was able to import the bcmdhd driver from:
https://android.googlesource.com/kernel/hikey-linaro/+log/refs/heads/android-amlogic-bmeson-6.1/drivers/net/wireless/bcmdhd
as pointed out by Neil.

I switched from brcmfmac to bcmdhd with:

-CONFIG_BRCMFMAC=y
-CONFIG_BRCMDBG=y
+CONFIG_BCMDHD=y
+CONFIG_BCMDHD_FW_PATH=""
+CONFIG_BCMDHD_NVRAM_PATH=""
+CONFIG_BCMDHD_SDIO_IRQ=y

and hard-coded the FW paths in dhd_set_path_params().


Here are the benchmark results on the bcm4359 (AP6398SR3 module)

# curl -o /dev/null http://192.168.1.254:8095/fixed/1G
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1024M  100 1024M    0     0  17.3M      0  0:00:58  0:00:58 --:--:-- 17.4M

which is noticeably faster (80%) than brcmfmac results.

FTR, system was 18.5% busy for this benchmark:
   81.5653%        195114        0:swapper        
   13.8287%         33080       57:irq/17-ffe03000
    1.3967%          3341      173:curl           
    1.1350%          2715       63:dhd_rxf        
    1.0455%          2501      129:ksdioirqd/mmc2 
    1.0004%          2393       62:dhd_dpc        
    0.0167%            40      171:perf           
    0.0088%            21       19:ksoftirqd/1    


I was not able to get the driver to work with bcm43752 (AP6398SR32 module).

It loops with:

[   15.221622] wl_run_escan: LEGACY_SCAN sync ID: 0, bssidx: 0
[   15.221661] CFG80211-ERROR) wl_run_escan : 
[   15.221664]  Escan set error (-37)
[   15.229067] dhd_ioctl_entry_local invalid parameter
[   15.233902] CFG80211-ERROR) wl_run_escan : 
[   15.233904] error (-37), cnt=1
[   15.241056] CFG80211-ERROR) wl_cfg80211_scan : 
[   15.241059] scan error (-11)

But I may have bungled adding the "new" chip, since the driver architecture
is... [censored].


I suppose the conclusion is:
1) bcmdhd is 80% faster than brcmfmac in one download scenario
2) CPU usage scales linearly with throughput (on this system, 1% ~ 7 Mbps)

Regards



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
