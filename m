Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBCBC3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021EE22DA7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdY1tMRw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hrQo4lV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021EE22DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06sO4Y7DdDGaNCrDjb+WFu5YQanMcegZG2ydLxhXeKg=; b=tdY1tMRwKBUnF4
	MhJPphC3YPyROZKi2gXvSzBHBrmBbfQtZ9ogbdY2IxehDLhWM/90x4Sk1J0upVMtylCKBDJXhUwIS
	KvaNbiSYNLa2kQJDwVpKI1BfvOF0HA16QUZMtmKQq+LQXeUD553aF5z1uzZ0CN6SK+SUV4CKlgWFM
	VZw05+SD0KwrvLjtn5Rx3Zr8ukBrE07riYQShtnQmgh+xOw9MMNH41uTVTroNP7PGUxAMHvLV8+Xh
	RTzV+VRiW7iGmdwhhKgiFr15todKZp8Rb643qRHW/9VWz9Q7Qoo0sf3AV5KjX3Oagik6t12r68mRt
	IYjrTNhqORALk2Sr2+ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0AeB-0001Yl-Um; Tue, 20 Aug 2019 20:22:28 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Ae9-0001Ua-DR; Tue, 20 Aug 2019 20:22:26 +0000
Received: by mail-ot1-x343.google.com with SMTP id w4so6273601ote.11;
 Tue, 20 Aug 2019 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6O3nF6OsIezS3m94/FyyV74f4w1BQyF9b2ftz/OG11g=;
 b=hrQo4lV2skKSXv8CtS6ag3XtN8M9PayYvljEnc7WxrhkY09nskwWr52OHiPXLlac/p
 JYYske9tLSwYCj7fKXR9ASj1nickrFwjy7/UUffeXRcRuv7kHgWy+zyk5Uk8wYhVKL3B
 OU+CqtU0ePFWo5Agui14q6YGolD28BEvzq5mnoEqVm5bv/BiF8gJS7cJH8hwEzjVrs+Z
 et7XHucKD362BCEzf202AbmP5JCpJHc4d6pgE97JaAyjQaQDnDxCcex0s3ONoftF3sCe
 Hghp7DgWk0/YUFJVeTs4VxTehrVte52Odt5PhDrNfRSntGPSXa3q30t67CZRzVR0oCoo
 JVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6O3nF6OsIezS3m94/FyyV74f4w1BQyF9b2ftz/OG11g=;
 b=Mi95rVPgJ6vEVzRZY4TjlE/9Iyqf8ooIANR6aLqtdl84Tw5aLFBPjo0TZeL6c5NI5a
 OWOhkFJmhD0M/PLL7t259zKFqPLTV3XLEG/5+lKAaiU+MCh9HB2Okxo0fwhiWAVC37pN
 ZS9PO7XignZt/9dOCTNaoKmOht5cp5MtbPi8V6XZAR+q8afLtp0ehJGtSrXKD499MFNN
 5iiC9tvS7ZWino4GOxzBfMLk4/V7ceRMdbENPLrklSLiPATzBrIZ77Wjn8jXWlcQ4eDa
 ZEtOfgNzeb2WJtmenj08JTl9jbKjc66QLZ9Gnbbbn2y5HA4d3CYIdEpBEbcOK3pnyxII
 coQg==
X-Gm-Message-State: APjAAAXo3lSojsdteX2spHdooEipGe+nB3DpkbvKRqGZtkw+il1o+uXR
 YZXEe8yzghB1S/zGAy8B4ZMS3cd7V6yKughQw6g=
X-Google-Smtp-Source: APXvYqx0K7h6tbDRl+C7T3XrBX8gwsSfp6tP2WE6DpcngUbYzTfI6pPfbkaRk0FBWUCRTaMk0XJuqy8HU08MhXtXY88=
X-Received: by 2002:a9d:6303:: with SMTP id q3mr18030706otk.81.1566332544240; 
 Tue, 20 Aug 2019 13:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-6-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:22:13 +0200
Message-ID: <CAFBinCB1fRP8-JaUN4sgwFpinUkQiXvo6COdP54-H9CYkmRKzQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] arm64: dts: meson-gx: fix watchdog compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_132225_607560_5D6F15E9 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:30 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxbb-nanopi-k2.dt.yaml: watchdog@98d0: compatible:0: 'amlogic,meson-gx-wdt' is not one of ['amlogic,meson-gxbb-wdt']
> meson-gxl-s805x-libretech-ac.dt.yaml: watchdog@98d0: compatible:0: 'amlogic,meson-gx-wdt' is not one of ['amlogic,meson-gxbb-wdt']
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
