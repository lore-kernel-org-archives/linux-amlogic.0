Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50500EB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xmdBM7Ua9NSBqezd1PTIhgAbr86nsPKhfvwHxG+kA4=; b=ymSYMeJBCSsA+C
	JZfij3H1S6kEJSYSFGyLT+gg5OwAtk6LUf67Y51W+5JBXOnzi90xSVcTfT/S2YNUgZhOlOKkeeXV4
	o0R3NzM7cjzL7QbY0OejxLuhffRzr/Jws7vUn/nk6TI4oiPyaB918za8ExBB5IOTzHE5dUcXMTYBB
	CAt2zfEf8jsvBXjDA0MCHGaRnKgHW/fpVIcE1R9rwg3LjaP6jUviQSqpUyumTondKBOCPJ/DNyatd
	sraDw8jvUmxflnqDDjyNRDkHvJh7EQ3PIxkApJU4uBNxGeNI73i29j9Rr51LKpL+e/USrXgE9tqRA
	rGGRMDlPeSG2POkhEMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHqlc-005UEG-22;
	Fri, 07 Jul 2023 19:05:20 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHqlY-005UD8-1J;
	Fri, 07 Jul 2023 19:05:18 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A795E5C00D6;
	Fri,  7 Jul 2023 15:05:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 07 Jul 2023 15:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688756711; x=1688843111; bh=S/
	sKC+j2TRg2RQQy0ZV7Lc1gET+LltLUonVflsJid7o=; b=XTjGP7IVmi6yN46O7T
	Ci0BcMSjK9Yl6Dg2Zk7MChMgoUHr/K+qhSkiY3sVhTmkintjM8rYAfWSFaEUaQym
	YyO6w1vcddODF6YxT47uEcJytirJE5F/fF85WomWpg6Cfzs7KQBpJSQxheMMVZ+H
	mZNoS0wcVu8cV5o85EcarTlsr/5Vqf9AY3sN6UcjP5h1DNcXXS2BGynAH6jWW8zy
	1B/fbQa60RxeeWnw5xnxnVJigIx94KNWqyAzXxrtgA16fHFn21wr+a7g91QlA8Fp
	fsHpG4VoxM07qRYJB4oIZ7fg+wlgYux+1wAAnLchrNfue0NzyM7SSN516V6Uv0WK
	LTLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688756711; x=1688843111; bh=S/sKC+j2TRg2R
	QQy0ZV7Lc1gET+LltLUonVflsJid7o=; b=hSforSkRer7o84ADH2YsHbx2ZAoPR
	wzMqmFd+sBroTfYKoJ3IUojG+foqlNogRBvDU+qi8p0vgZgmpvb5GqAbkAHIyNBH
	rtl6VhDDCGE0DBrddgzEmSCm0c508T5H5YdcLygSvuxdjS2ZZ6WZWF5R0fstlzbi
	wJd4RG+zxa50xaVHf6rx30nCC1akuW/56sYSNshEyYbfLVpaIglT/MxrNIpoTHlD
	3G/5FPp+TQihS2M12cV1SDdWFrXAQNmdui/hamqFoGXrS7Qv+cRoljNyXQ2XT0JJ
	VFmxT4rQp+dlQ6N7vI8zmkvmINwnVG4PFIC5dw44wduKY1krcY8UAXHHQ==
X-ME-Sender: <xms:5mGoZKwEcncMygIYkFErlDqR-j3pBWPufhGNzbVSgMnv-CuP0eVQmA>
    <xme:5mGoZGShRApNxSrKZcVFeulHfLzTKltiPr8f65iIvY_JHjolBfWi2ZaMSXYaRHc0v
    7VQSt5C6Ztau79D7KA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvddugddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:5mGoZMXnyH8QeZquYT8O7HkU-OGrPIisdsi1IoHPE5cdlceknXAcvQ>
    <xmx:5mGoZAgZRa3xqgAgqD8BJS-S2srYocMIm-slw6Mght1ZIpcl7mAbMA>
    <xmx:5mGoZMCcjBoh6pCBUEaCWuDueyZyMRF1iZ-cM3LISDTvv9JwCXCXNQ>
    <xmx:52GoZKBMabj1UfKaCW41m2q7QGKftXrE7TEAp5dytvrK5JI_F3rFZw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8B6A7B60086; Fri,  7 Jul 2023 15:05:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <653aafb6-ddf5-496f-a780-6d5214a3bd00@app.fastmail.com>
In-Reply-To: <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org>
 <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
 <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
Date: Fri, 07 Jul 2023 21:04:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Olof Johansson" <olof@lixom.net>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the genpd dir
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_120517_009352_FC53F247 
X-CRM114-Status: GOOD (  10.29  )
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

On Fri, Jul 7, 2023, at 16:54, Ulf Hansson wrote:
> On Fri, 7 Jul 2023 at 16:42, Neil Armstrong <neil.armstrong@linaro.org> wrote:

>> > @@ -2,7 +2,4 @@
>> >   obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
>> >   obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
>> >   obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
>> > -obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>> >   obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
>> > -obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
>> > -obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
>>
>> I've a few changes for v6.6, how shall we handle that ?
>
> I think we should continue to use the soc tree until v6.6-rc1 (or if
> Arnd have some other ideas), there are some more thoughts around this
> in the cover letter.

Right, I think I can handle the merge conflicts as I add stuff
to the soc tree.

     Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
