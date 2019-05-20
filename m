Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668F0C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 424BB206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fn3Lrr5S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AbQa4d1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 424BB206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFfL653+jAVtEtF1oOWKqESZOHz8pukZZwCthonc718=; b=fn3Lrr5Sqn1hZi
	RGgu61Agljw1XTEEfULFXtJ9A1BbLi4qbLsCE1c63l0Wv2+jKnmXn8UU97OetnJhpvIJ7ObdmRDNO
	NAFslThiUnZiAj5YPkFuJcY9L6zXe+3p8wEG7lZ1xplCgfp5lof6GxvQhhCF3b1GBHBnXWfwfV7ZX
	oedBM3mFHOPNTQPyoqGgk5mr5XbQ91YbbVZ5CY0mB0QchOyuufmIsAgl4xrE/BM7QI6CHTGC7Hwtd
	h6ZFEbpBDiBIW9O3bQTu7dEJAyBCM6zcD5hrndTKHzBJGmJXWaHqsqF+3afRRPKEWx9cFp2s8FIP/
	VeKzk/7cn8bPN9ZCMz5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmSB-0005F3-M8; Mon, 20 May 2019 17:52:03 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmS9-0005Ee-9J; Mon, 20 May 2019 17:52:02 +0000
Received: by mail-oi1-x242.google.com with SMTP id r136so10675001oie.7;
 Mon, 20 May 2019 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLlY3qA7vJB5pB/85supzcun/5fE7fwwy8teM59jstk=;
 b=AbQa4d1keqd/BDD7x+wNAp7tmtUjC9bTqCW4WRudeyF15W9elUiBJ4chChiuhZE/Rw
 LRGi5hAY3QteLppe2OwPYbtx8KEulzBqeVNhlxiJ2dozNJg8Wo95y/q37wWHGQhfASfV
 qb3Yg+46JYqq2oTHtt08qKjFz0PyHjG4iWux11r4C32ER0+tRazSJp2FKBtAePl6h+c9
 ObHWWXcoPFPUpu57FHOacEYoGA71+Q0Jd0dSvNP5HeWyLjmsXHdCqqdA6zZ7xb2SmBm0
 gTz9ZDbUYAbJrvtqCoqg4TKnOgzjTqIQHgtNYakEPVgEl6iF6hyPus2gO45bDO9jSBsa
 lbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLlY3qA7vJB5pB/85supzcun/5fE7fwwy8teM59jstk=;
 b=ZaOtDz/FfBFKu7mZBdTFjrQmYeyjxGKxZOxbJFeFP1GixGg70op1s6SQnBdo+qpAhM
 V0R3Zsnzv+uLb+RiAV0lQ+ZQaGJDUkK8c63aUm60rFxv3YDAEHXJGcFvVVlb3cBWoFv1
 6YtlCr3bbCooPTefc+nNYJ7oCTsdNtD7XRWrR5U1NxcMZBtjpRTl/o1PwPYU73/c8TZV
 2Ck8KNF0Nf9A3qwnO7jiNM0EO4NdW3c9I5X7mUsbAIm33a/ccLdufkGUjNCaivbNqCM7
 5vXUpA+INOphXH2QSLCHHGmCDIWlLDymh+lc6unx2JIjjtDU7RMkMiAm+2zfu6qAYL8P
 0Vog==
X-Gm-Message-State: APjAAAVznA3Rvuv1FBoLAb7nvb+RkFVVvC7R9xeX2rKPGnzP8IPbqJtK
 gi16rE6chEyQP0jis+t3UesRc4byq1wd/Y97HQ0=
X-Google-Smtp-Source: APXvYqxiFXL690TZO93hoIiMXPwRHNWOJXmMa25xFpK2VvQFxaqq4LCf1V6YJFp9f3Jq88uc83lFjBYQHfTH/0m7wVY=
X-Received: by 2002:aca:4341:: with SMTP id q62mr304351oia.140.1558374720213; 
 Mon, 20 May 2019 10:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190520134817.25435-1-narmstrong@baylibre.com>
 <20190520134817.25435-2-narmstrong@baylibre.com>
In-Reply-To: <20190520134817.25435-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:51:49 +0200
Message-ID: <CAFBinCA+G6f8pq8zPwzq6rkNmyS6U=7fL5HWnObvWDWCB893iQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson: g12a: add drive-strength hdmi ddc
 pins
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105201_321280_3A459149 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 3:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> With the default boot settings, the DDC drive strength is too weak,
> set the driver-strengh to 4mA to avoid errors on the DDC line.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Amlogic's vendor kernel (from buildroot-openlinux-A113-201901) does the same so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
