Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5F3C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2864820883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gnWyzv6b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BnF33Qfc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2864820883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBRtOUIGD8Dy1xRh21tuOQfUuPyD0HWeV+CHcNo5EWA=; b=gnWyzv6bpTjDZb
	F2FEIGDKJOGSts5VYrV8RwKPNurRBnSRVZH0a1UTlMzHiY3X2yzmoTzAuXDnwSMx62XOxmivr9vXE
	TI6HWbMB8K8Sr2FWGCnLz4OCLdQ5zk7lmnDJUTY1M7bqdoNuLcLlh/fhJYebDxKPtXmEP8eWFVVe4
	0iK7aNrylh9gCF5pICK28TNW3MQ9ybUGi/AAY4RISJgIxL/eTstiLvPK9nhnGt7dygpoq6wjH8gu8
	jMgDSo1ejCuPgeXqGHu1yBi5v49jkikct4UByV733+4rjYzR/hrmHw3b7Xe/oUjDta3PucSDxjIOe
	SWeQF084AGyHEYZ0Go4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKUa-0002eR-VO; Mon, 27 May 2019 18:37:04 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKUY-0002e2-Iw; Mon, 27 May 2019 18:37:03 +0000
Received: by mail-oi1-x243.google.com with SMTP id u64so12488735oib.1;
 Mon, 27 May 2019 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K/PmDBxFzH8tIFTHeCN8YYedLt/VhrXyZwuXh8ChqC8=;
 b=BnF33Qfc6hc04kvTbL33hHFtPEQe/ra0NYmvx7YSNe8q0ZZWZNZR2A6OUFcgD7KhD8
 0ed+u0dHO4dAKHTwLK+vrAYoR5sL3/aHw6MBuHPscIGOYEFh0s7WnKWJag93QdJrQ/iu
 GTPG0beSa3F4DNfgoh+IaEOu6sCA7SiiiIpSLl+5BjNCiAJqxq/6hy1mye5IGynfj10W
 YeXWzNboNqyDcKvUwmA+bOFn+HKubU5RLDahKXwPlt5YGkuC+p+HrLgAkNbhyRCjWNtc
 S4YJ1Bbs0wIEhE3hejpPQKiq+7nXt18sLO9OZmtJ9/lrqh4LA4VnnADhLAgxe3U+J7x0
 ZxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/PmDBxFzH8tIFTHeCN8YYedLt/VhrXyZwuXh8ChqC8=;
 b=CyXARHFRbPpUcIA2uV8gKMrJDB8Xd7dS42wTk94rGFcS7O8zH4UrpwJ32QVqjNaIwI
 uBpZsm1BzwdcsofUIG1BTRURL9xiofBc7zyZRCuvTfhDbonl2pd8G/LsDvv+2RM9j2R0
 M9qvF8lt1sQ6FM9gfGPAUZsxrqPYTnQ5xwH4/cBHLlBCssCT9lEbOf2m2i0FwBzMwJE/
 KjToot4aeTdMnJHf05bC+W/CZQmye06fBxZIUca+rNcmvl8uPAO5TfMtvGSrmR/ZN9kV
 8nS1DaZDvfN1xNE8RndfEHk5gfgXBFr8Eca/UA/lLEhwW0K5b5iYRApRT/qVVZtzuna8
 /b8w==
X-Gm-Message-State: APjAAAUg/c//dW+JRH/oMYIQ/lqmLVHXRB9e3MIhzexmyHz4PnQKjmWD
 BiJ1L6dB84c12VPJbCw40kkgSzQCGBtJ7V/8iwo=
X-Google-Smtp-Source: APXvYqy7PWeO9SByoGpDLEPMAWmWvYgNfuTseUq3cV5VsDUG4L7srEriatKm4lJuWJ76zmnViuz6ssDvlr761juw94I=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr213510oie.15.1558982221761;
 Mon, 27 May 2019 11:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-3-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:36:50 +0200
Message-ID: <CAFBinCBTK=6OW4kG=i0KZe-+AzGVXyou9g0frnh9yqLsdmB5+w@mail.gmail.com>
Subject: Re: [PATCH 02/10] arm64: dts: meson-gxm-khadas-vim2: fix Bluetooth
 support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_113702_621441_A93F362C 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> - Remove serial1 alias
> - Add support for uart_A rts/cts
> - Add bluetooth uart_A subnode qith shutdown gpio
I tried this on my own Khadas VIM2:
Bluetooth: hci0: command 0x1001 tx timeout
Bluetooth: hci0: BCM: Reading local version info failed (-110)

I'm not sure whether this is specific to my board or what causes this.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
