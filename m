Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654EC001B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Aug 2023 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEThwgYAin0QcyOrInzoiAvkTbgMdqY8paufwDt9GW4=; b=DyqjouT1IZlBk3
	ohS6VEjvMCTx+bPzPGixumK8E6RLcvp5DQfJKSwERZ4jpSF4Jh8poSfnEgiSubqQMt8LHyPkagrVm
	jf8MGxY4QZVZXMOS9F4Psg0+PhdTf7vpwrfecBfPoGlIeobDbCYd7KkIvmJpl3xNMr33KE0Wx6S5B
	S+9TTMGwpE7v+6PRrnSdbH+QfGpPWo+IGl7RW9VNLOEFWxs8CI+K+G91ldKrM7Nv8U7QKuBdXO4Ic
	7CCVY5CrP0RxX6c2syODgnJJ6mcWADz91VPIKzehQr+KuYcnskGeD4xVSo+afN1eY8EhMhgL22bPu
	3Ovdlxo5rfEeZyGdRaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqZh-001ERp-0A;
	Tue, 15 Aug 2023 09:42:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqZc-001EQo-2R
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Aug 2023 09:42:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe5c0e57d2so47195315e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Aug 2023 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692092566; x=1692697366;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=o3HpNllNIJATl4218cwCPumVvNpYnT0jHatxINajSxA=;
        b=SrmhGXAAFUIGe82A+SUcvUAGa8VztrbtO7q1uzgKt4Vbv9oPVwWnBFHrG1KFOpipTh
         vkpvagvBYDVIqigFSnqE6SviWmy+infbKsoBL+SQP+9x/h3aur3EGPC4gsYXbIWkEGom
         TFDLlvaC0pW9aAjoxThOnJuXdvXvB4duh7ZzZ3DPjJX5hwTrhdwQ0vaV9TqwO0mDjbI/
         5m1ktq35S0c2moN+61gc3v4kLsuL49QP5SA61ToMEYFagU+NiHpfCjc25+50RVHdJxur
         X76F1TKhUVzUxuKnNjYvf0egrdhxXHKn+LyU5y/ps4ewLrp37KK6jCRNGWCWyZJe+xTF
         2tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692092566; x=1692697366;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3HpNllNIJATl4218cwCPumVvNpYnT0jHatxINajSxA=;
        b=QU3RU3o5i77OKd2d1mPXIP1sqaNCiu8hFfcht4bx80mexy3kSlBBEwxQxaNBZOnHR8
         +LDm6JXV8085OVVnSbxWhLxMvYVPpDtKfVZMgI1a1XoXGgAWCxrHNCC71D0wCU/ZaYZ2
         V2D5xqpWq2ci8YvKsXYRpaDiN1ZBSEBOF1fmS8t/vmjqPdxU2P89hzEexnw0H95pevEd
         8uOmlq8gay5HrGTZccmEHExA5qdUFbdVDMhb3BljlxTMkRjfSv5GUeCjAit4pfkmA7T/
         6pNtIewuyPR1QJaSIHd7W0rnfLzK99mugNKJ8eExSftPxwjD/s+NnbYIioE3gaWOV4bP
         dZdg==
X-Gm-Message-State: AOJu0Yy5E35T7ZHVBH9gLvfFsFD0ovT3NpGH2QTiuiNXGZkxYS3t4tkd
	ixrHnvl919DTgurFh6nLc2HYIQ==
X-Google-Smtp-Source: AGHT+IEAnsI0NDPngUs538CsVemZRyT6ErVk9cE0dJy5QJptvg+a3O1YaadMfUnwJy9AzieYYWfo0g==
X-Received: by 2002:a7b:cd95:0:b0:3fc:114:c015 with SMTP id y21-20020a7bcd95000000b003fc0114c015mr9087147wmj.39.1692092565313;
        Tue, 15 Aug 2023 02:42:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a9fa:56eb:482a:ba03])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm17166640wrq.68.2023.08.15.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:42:44 -0700 (PDT)
References: <20230815092751.1791195-1-christianshewitt@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: amlogic: add more basic audio support
Date: Tue, 15 Aug 2023 11:37:58 +0200
In-reply-to: <20230815092751.1791195-1-christianshewitt@gmail.com>
Message-ID: <1jh6p0vdyj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_024249_009710_2777926A 
X-CRM114-Status: GOOD (  10.98  )
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


On Tue 15 Aug 2023 at 09:27, Christian Hewitt <christianshewitt@gmail.com> wrote:

> This mini-series adds basic audio support to the P200/P201 (GXBB) and U200 (G12A)
> reference boards. Few people likely have the original reference boards which have
> extra audio capabilities, but the device-trees are widely [ab]used by users with
> Android set-top boxes whose hardware is copy/pasted from the reference designs to
> get working installs. Adding basic audio support does no harm to the real boards
> and helps the secondary cause.

Still, this is something you have not tested on the u200 reference
design. I believe this was already discussed in the past.

The u200 is far more complex when it comes to audio and certainly would
not work on this no-name android device. These device are heavily
"inspired" by the reference, but trimmed down in many aspect including
audio capabilities - NOT copied.

People abusing the u200 or p200 DT does make the patchset valid

>
> Christian Hewitt (3):
>   arm64: dts: meson: add audio playback to p200
>   arm64: dts: meson: add audio playback to p201
>   arm64: dts: meson: add audio playback to u200
>
>  .../boot/dts/amlogic/meson-g12a-u200.dts      | 129 ++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-p200.dts      |  60 ++++++++
>  .../boot/dts/amlogic/meson-gxbb-p201.dts      |  39 ++++++
>  3 files changed, 228 insertions(+)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
