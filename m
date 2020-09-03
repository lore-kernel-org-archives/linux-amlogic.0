Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF88EC433E7
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 08:43:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6295206C0
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 08:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUrgBnaa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhKL4JCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6295206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CEQ/8boGjfiX6B9CrbaK1fhWQuFa6CRurXJfrNEbz+U=; b=BUrgBnaaIJTDVLaxgDEMvwvcC
	UnrVp6WQR95QRl74h7az1fRtDCXVcYPswh2+fuqgwZdfMYqSzgd5NWnt0NaLbUqF1K+nxJMoK905P
	VPn62exkDwJzWRvdhSumtpjxvZpUzrqUvvpngf7HHNDlSReT7gUg/uNqiNmlTx7iLb+b1KrrWLFsd
	O2PE76PmhUVyhkuQwxs+OkbNRpTxWGpKLdCh7dVpNDV8TEzRhMVAlorFjRAhCNsS7Z6CxBqtlJ07H
	SZP93vN52rSqDnoXgD7H8cGHyaTNMpy41UgcxwiHByX5hhCdEZNbejj80Uqrj+lzZpBCZ2SaANGDn
	PPheZXYMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDkpy-0006ex-Nt; Thu, 03 Sep 2020 08:43:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDkbX-00081T-HD; Thu, 03 Sep 2020 08:28:38 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFAD320C56;
 Thu,  3 Sep 2020 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599121702;
 bh=JhGgBN212oQdocLFQd1GIoMAcjo2XnC8T3B/5UMegcI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OhKL4JCKxO8wkJt3BpKgpeyR+xjKvGd+Jf6f9ApeUsNsOOd5pYsVjoWwx/MzQ3fDu
 TxSC6OtqCCQhokskh5ao0/2qcWh1FfbNbiFsuG3Ezp+Rj7E30aFR+CslSXna1cCYUI
 qkNEvD4QyK0JaNubUIKAvR6L2eyA0GKTQoebitHY=
Received: by mail-ej1-f51.google.com with SMTP id gr14so1505067ejb.1;
 Thu, 03 Sep 2020 01:28:21 -0700 (PDT)
X-Gm-Message-State: AOAM532ixDRG9uf+hX03ir4hBo7cID4H5ZNAJ8igqw7d1XwF/iOdL8n/
 aHYvw/EwjyPHnE8AOlZVxY3w39SHimq9ZYl8ciQ=
X-Google-Smtp-Source: ABdhPJzSfQ5TJipTleRhjOrSLdyfMN0JGOZNyUW65jvCo0Y05w2r706QOVOn6IspjV+kQPykXsQI90zE8KU4nNs6Fm8=
X-Received: by 2002:a17:906:af53:: with SMTP id
 ly19mr908583ejb.503.1599121700549; 
 Thu, 03 Sep 2020 01:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200902193658.20539-1-krzk@kernel.org>
 <CAPDyKFqBS-ws6fkirDQL8EEqh9At88K2vrG5fc8K5_JiXsmfyg@mail.gmail.com>
In-Reply-To: <CAPDyKFqBS-ws6fkirDQL8EEqh9At88K2vrG5fc8K5_JiXsmfyg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Sep 2020 10:28:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeLMvaZPvyyh+embqzhHPDRfWcDF9_LxCJn3PqMP+8mfQ@mail.gmail.com>
Message-ID: <CAJKOXPeLMvaZPvyyh+embqzhHPDRfWcDF9_LxCJn3PqMP+8mfQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: Minor cleanups and compile test
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_042823_687597_8E0DFD00 
X-CRM114-Status: GOOD (  11.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAzIFNlcCAyMDIwIGF0IDEwOjEwLCBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBTZXJpZXMgYXBwbGllZCBmb3IgbmV4dCwgZXhjZXB0IDExLCB0
aGFua3MhCgpUaGFua3MuIEkgd2lsbCBmaXggcG9pbnRlZCBjb21waWxlLXRlc3QgaXNzdWVzIGFu
ZCBzZW5kIGxhdGVyIGEgZm9sbG93CnVwLCBhbHNvIHJlbW92aW5nIHRoZSBNTUMgZGVwZW5kZW5j
eSBhcyBwb2ludGVkIGJ5IE1pY2hhxYIuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
