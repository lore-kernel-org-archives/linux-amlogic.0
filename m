Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A2C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Aug 2023 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fvjZZGA6c6RE3wNlYafuXCaL6gwe56OJOxgOVdi3FFE=; b=3jkeZPC85WecmC
	2VCk9aqmltXPWlkI+qj5lAD8PHtaHX39bjncAuen8G0Tun/cTDo+gbVLh2D/2O+gITdvJ+v+lEiHu
	J6pn8dzaj3UywVbnJq28es8s6poXsYOSvcxpEAl50B7JxUOZDWIn68dW6EOBjB1a+/UhnyjFBKNik
	YFkx8TcV9pUsg3xP8FXss9LYHRfxTzBdOIM7Uqdq0JozaKZbTkm5XGRj8jtSRogwmvvWVd/YtMKrn
	9XbL+pXVx84xp3OqhXSlWp+xA9Pcbw/YMvJQqCU7+gXqhdkpvq5tumo1sBQXLweJthO4P3dP7CtNG
	iHtrqrE7PXf6RKMxKaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLK-001CtT-37;
	Tue, 15 Aug 2023 09:28:02 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLH-001Csl-2k;
	Tue, 15 Aug 2023 09:28:01 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b962c226ceso80749421fa.3;
        Tue, 15 Aug 2023 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692091677; x=1692696477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdeVCEOEq3IkqSl8lDhrM4eFNQnZwh1jACSNFV8VQn4=;
        b=M5xbtJPjLw4KCMdi3TdevUmVGy8Z7WVJQt+UoKTL1z77zJxfamamUAsIwGUhud5OvX
         2UcefmbbUu2AjG0VcmvrJ2sC9wCz4PV4Gjjv+3JtWbW57LvEGsDDyywQo/rZlsesgRnv
         AqPkELQpCWPAKhYcS5HTteN3qYSwJxV0x42nCXCeelmw+2Edx3CHOeXZzmDbYR38ayaN
         G9yaAIaC8dqTghp5uMTJHH+tmGgTX0aHh/wWO+fyBdYOFuAZHezYFOyATDEXHRsOQA/4
         JQlXHPHz+MQ5KfWkEI7IbXD9uqBUfAaqASWUvngZXANHDNdaZSJ4xSwc7aG7DBWEXkuB
         TOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692091677; x=1692696477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdeVCEOEq3IkqSl8lDhrM4eFNQnZwh1jACSNFV8VQn4=;
        b=LsYN4dn+gv97KSsF5KihnMHgzLpLnKKOSJcTiNcCAW9Wjd+ir/hhya8BIZ8Q0lvRse
         qENQt0sidsWOwxYdmlomdtORluZCN24hyQhFfclzpNqbF4VSER+/FaKExjV5GXN1M0WE
         d1h9CLcswDIDU/IASrn6y2OTzhzzmM9FMHzedQqTAYxyaxoYQsYRKYj9Wi8V22TO1Gey
         E9Uh/3BLNSiJB3SBk9Nhmc6gIvtK1Xl/GbjTdVYP5dNlT4BBfCkNWzLFZkBp8aVsL5sA
         3stRQsxe7xkskLswbK46ofH0VHR1s7wC+4YSSAsI5/O4xbIC+VEuiJthZpR02pmHiDo1
         5GSA==
X-Gm-Message-State: AOJu0Yx4KQZjqLjnaTQGfkTmfERDrIuK42AJ2PE5AcPwtUwADqPea0qE
	VmOUmPgs/BF+AYtlCw/PSgE=
X-Google-Smtp-Source: AGHT+IGygiHXlVQiObE/1QBEILsWiJePF+nIYsZEgpCf4YcO1Sf9M14FSD46HJfe1Bnrx2J0GtYGbA==
X-Received: by 2002:a05:6512:b84:b0:4f8:d385:41bd with SMTP id b4-20020a0565120b8400b004f8d38541bdmr10278325lfv.8.1692091676625;
        Tue, 15 Aug 2023 02:27:56 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id p1-20020adfcc81000000b003179b3fd837sm17230853wrj.33.2023.08.15.02.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:27:55 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: amlogic: add more basic audio support
Date: Tue, 15 Aug 2023 09:27:48 +0000
Message-Id: <20230815092751.1791195-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_022759_888254_B7CC2247 
X-CRM114-Status: UNSURE (   7.70  )
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

This mini-series adds basic audio support to the P200/P201 (GXBB) and U200 (G12A)
reference boards. Few people likely have the original reference boards which have
extra audio capabilities, but the device-trees are widely [ab]used by users with
Android set-top boxes whose hardware is copy/pasted from the reference designs to
get working installs. Adding basic audio support does no harm to the real boards
and helps the secondary cause.

Christian Hewitt (3):
  arm64: dts: meson: add audio playback to p200
  arm64: dts: meson: add audio playback to p201
  arm64: dts: meson: add audio playback to u200

 .../boot/dts/amlogic/meson-g12a-u200.dts      | 129 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gxbb-p200.dts      |  60 ++++++++
 .../boot/dts/amlogic/meson-gxbb-p201.dts      |  39 ++++++
 3 files changed, 228 insertions(+)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
