Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E59C34056
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 17:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D866620801
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 17:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tr4+NgRb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rTS8Mo3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D866620801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1Q5uKEFNtDOqDEspUvdGExOuj6/t48s9FrcHdrY95Vo=; b=Tr4+NgRbEh1vTRAfEGiRaprAXj
	/2uhbqDe3PBd8js8G7BvjD6+GdTZnbDFPB1Lxk6Ejv80F/nnYu5FiXEn1vvMgYSOGstoGbh5VSshD
	QuyCUKLEB2S9pdvfCWctS2AGsObhL3lpGs73gN8H3BDJHnMXgsnSe5O2ZuTUcT4Tex9hiRRF5dzvk
	EJ4hGsbOPPQbyFQxhMj0MFz9mFsyA88ZLvR11QC8b+gEKuAKmMbv582qFd9L1Z6sxY6e8eh4gGUOO
	Gt/2/1jaHW154od9JaJzVKi9WGfD/AfBBHtbNj3nRQ2hf1aX3sF4EXQdvVmwsMBfjU9b+GS0TEATp
	NaaCWYoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4TBH-0002Ee-5G; Wed, 19 Feb 2020 17:30:39 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4TBE-0002Dl-F4
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 17:30:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so1568904wme.2
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 09:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Vzj5fYuKhjSJIX8LLdjrzndSdJzkfLdinYyCt3Ld6uA=;
 b=rTS8Mo3OfNleBFSAn1y54h2JccThE9WwvMh1CPzzw8Yv/pYj4cc9te+MrhhNmIfNNC
 yfMLNteGG2e0ZAG+BLaoho4eshauB17hHBJVUTQUMShg50KLiriDQfNh8KH3ZF8uc1dZ
 WOUriIwI7kgYXc1ltbH177D3QQ6VSgG6tpZAbDp+kvoBwLCodiK0/tTVNyjFghyem1Pv
 MKMcF4HEcr+GlYtisjzch3biOCeX3/FJjysohqklTAVaEM6UUBQAOcoszVsj9eHalJOv
 hsk9E+Bb5gW7eR8kkEABhXOQvYd2l6jdyRDi91HdpmBNdmK5Il+GGcqBVVBeONfFY/gk
 +0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Vzj5fYuKhjSJIX8LLdjrzndSdJzkfLdinYyCt3Ld6uA=;
 b=HRXQFogFQ1rWsdCrU2id/wXPt45qf8u4C3263qUQaruyw8jtkoQGjQLNCTFFoAyFjN
 Hs0cliHV+DKw4W4e247gegWOobPsCv7AbznrLttnHOEGcSJsaZRArdCo+5al/D2mkKz5
 JcD0lone+KQTEKFVkSFZiYklGDkOgzeZ+9ej07Vm25vWAV6MiTdjK+X/tSuVQsLxxVSD
 ImEwWgD4b9wJhfgFQuRb7mvK5J1b3NbTOpttDtE0OzvgZUjoYOQTw3SS9x9gti82R2FU
 YqsRdHzgdOGISS7RP2fmEt1UxPeOtqD4FGvE72mdcGTRuS1gTfxw4H5yLclxth7+tUSG
 0mkQ==
X-Gm-Message-State: APjAAAV5BDfLB8x2VGOPX/HbXMVoHOBtohxJX1f1U6KfmCVNtbGUNHmc
 8onrMNsDANA/RB5K5edyBFsu1g==
X-Google-Smtp-Source: APXvYqz8SvtcLoz81n/o1JvdjzZKZJ/qf8otl/+1C1BQrR5Z5QNE8zns0Qa9uLXu/e2c+diOPxnt3g==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr6145330wmj.88.1582133435029; 
 Wed, 19 Feb 2020 09:30:35 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id s65sm600755wmf.48.2020.02.19.09.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 09:30:34 -0800 (PST)
References: <20200219161625.1078051-1-jbrunet@baylibre.com>
 <20200219161625.1078051-3-jbrunet@baylibre.com>
 <20200219162000.GF4488@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: meson: add t9015 internal DAC driver
In-reply-to: <20200219162000.GF4488@sirena.org.uk>
Date: Wed, 19 Feb 2020 18:30:33 +0100
Message-ID: <1j8skyxz5y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_093036_545529_375C3FEE 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 19 Feb 2020 at 17:20, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Feb 19, 2020 at 05:16:25PM +0100, Jerome Brunet wrote:
>
>> +	SOC_SINGLE("Playback Mute Switch", VOL_CTRL1, DAC_SOFT_MUTE, 1, 0),
>> +	SOC_DOUBLE_TLV("Playback Volume", VOL_CTRL1, DACL_VC, DACR_VC,
>> +		       0xff, 0, dac_vol_tlv),
>
> Sorry, that should just be plain "Playback Switch" - this can be used by
> applications to present a combined mute/volume control together with the
> Volume control

Ah, Ok. I thought it was important to make difference between Mute
(Playing silence) and a Stream stop ... I guess the app does not care
about such detail. No problem, I'll fix this.

> (though as in this case there's no per-channel control it
> is possible some applications will struggle with that).

alsamixer seems happy enough with it :)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
