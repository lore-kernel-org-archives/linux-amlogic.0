Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80447C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 22:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2EA218AC
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 22:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rUM5MLXt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vgO9/x05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F2EA218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/GtRB7nsQD7q6Me6FPhvcBhqjQZI1iuQe8kKi6U7fU=; b=rUM5MLXtenMIXY
	B1DC8bVF3qTA6NaEBUPcywV7xkJK1piUHfSpyKqwfkZeowFVS72x8VWRVtYJiacRXL90c62QA9DVr
	I+96CMo27NSdIRvSUWQBNOfHYq2rj+E/Ht8G8Q2spLQGQRxm4sngbAff2a4pKWEpA6U8JNHBv3MJO
	f7OqSOPJKLeJBcF0sRKszHXKcSzKy8Cp6jJ0eIgFwD19m7YqdLrkpoO1NXmncvxqHnGwrAkCpkNL7
	PoYOppEcVTJmNiGNAdcnF2Ji0ddasx7BB9mxBdmkac8IGtu1j5Cp4K/zH9icBNmU9BAT3bXCcov0M
	R4brFdDoV6akbjcUE+0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5HUW-0002KB-7z; Sat, 16 Mar 2019 22:09:20 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5HUU-0002Jp-1q; Sat, 16 Mar 2019 22:09:19 +0000
Received: by mail-ot1-x343.google.com with SMTP id g1so11381538otj.11;
 Sat, 16 Mar 2019 15:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o528ymosn+dxRi3OgITbR69+jmWqSJKfAI21OdIVJnc=;
 b=vgO9/x05lFRtnPHRyy2BZdw3GS3NxUCQbEwaiUrytHncfrVc8epJnPIGigvt1Exlze
 axGuALHYzcJOVy4pSAHxmNHjVqrb9QL7nGZP6MOBQIvoE4Zi4xeusv3kU+3shU404ohe
 CWGlIIRJVxGAT+39o99EAc59Vjd+bsRIwpjPjND6+KMXktjJvqSOUVye2wo/lSgdxFJC
 cjiRBxcAjezRAu5SuUQ/i3E0hWs3837EUVif32JRcqBayFZG0SdLYDQQlDV+6fvLrHF4
 rlEPypyzez3oxzPwYzITihAQwaqn7jb4pL4N+se4JMmUuKdQP1PjeD6qie1/89/KEINU
 ch7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o528ymosn+dxRi3OgITbR69+jmWqSJKfAI21OdIVJnc=;
 b=BOc0FtIAuM2gb4r8sodc8eWQpyr+S/HTO7r9/jSmN/MV9B+C1IWDrKABmoYjgrJa/c
 P07ZJzm24FRjPxplhVCYLpa/DBFkN7V9Cw7IpckLh6QWEzHJltICo5kQGxu3iWThAr7e
 75t3SoGQ+ouF1R1HXbgRYilKxBQz5rW60byCb5Ek4uWA4k4y5Wzls/76VBrusY5bteWB
 BsVmbD1+aXeiOtfD924Nn/QwV8Vgj2HqLRD8QaZ4OM3bulWMfMZqjEqQhtyMb5uaj7+u
 ctPeCN5ZzDDIJtLSkVYALCdtmAE6UB7wQjQ0TtEUG+Fpxy0KmRGlfEyCdSBKIlwT5fXQ
 qNPA==
X-Gm-Message-State: APjAAAUVMuFF0dhRB1XZLwAMm36QzZu6LiU2m+pyh423cpkBH77Q/rmV
 YXv8mcwjoMxSruCcAbmr/jf5G5FhGZElwBP0Wqk=
X-Google-Smtp-Source: APXvYqwDbX5sYzypTMpAr4TZJ/pQpHChrM/OyDQGrO1BvCX/JH/ZqEou70Ws8PrexNCKPegl91cgqJDZLpEmJmVWS2Y=
X-Received: by 2002:a9d:5906:: with SMTP id t6mr6455841oth.308.1552774156883; 
 Sat, 16 Mar 2019 15:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-6-narmstrong@baylibre.com>
 <CAFBinCBt290Qabw98SpiON3xG0ihMEDNzwDDTrBo6QYbA5QjMQ@mail.gmail.com>
 <5C8D08DE.7070203@baylibre.com>
In-Reply-To: <5C8D08DE.7070203@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Mar 2019 23:09:06 +0100
Message-ID: <CAFBinCAZt75BxJD6P=HRF4tqvJd_QmrpqKQu_GbKzv6cLhnLew@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: meson: g12a: add reset controller
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_150918_102842_B02EF096 
X-CRM114-Status: UNSURE (   7.81  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Sat, Mar 16, 2019 at 3:32 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> > Do you have any hint how to verify the CBUS offset (0x1004) of the
> > reset controller?
>
> You can find base the address found in the G12A DT for the usb2 phy :
> https://github.com/hardkernel/linux/blob/odroidn2-4.9.y/arch/arm64/boot/dts/amlogic/mesong12a.dtsi#L379
perfect, thank you!

feel free to add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
