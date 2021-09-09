Return-Path: <SRS0=iK0Q=N7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D49C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE991610CE
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE991610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WE3OsKvdjBfNBAsoCMn6/WmUEHbkik74vmTphjSNdpI=; b=O/jD93J+onJXrd
	P0VJFWoIFqbB9OA0/raZ6WiLks81W5PJVKaEwsd4emNyaReCa737YoiOL5isCcmQJ8JvU04X0W+p2
	nNj0UUOgcosnSu/sjowppJbL7iH2pMMuXZvqjj/furTaN/hbv/O8BFML3r1MrX5b211Mq5WTHi9Q5
	WeoIEDPuRxbzs2RrNsBhLS9S+QfvOrWmiV4frMjCq8/IjFlG0HIw0og4tTN977o3+HNmURY6J0p4V
	wuKZ/0BeLWcMjB1iSGc4LPylWGSsWqkrBWinV8dpPK9Lf1ZA6khFwT5tie+p9atths3lrPIviTr3U
	1tL8Aw3fNSzVD/yqNGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOHCA-008sis-EO; Thu, 09 Sep 2021 10:22:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOHBx-008sgO-Pp; Thu, 09 Sep 2021 10:22:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id dc3so2522424ejb.10;
 Thu, 09 Sep 2021 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=TfW4psnv/zAnc1AOOFz+MTHAzd1Q3PArM+8GhLHC080=;
 b=emh2BPqu4FxGfim9EKDq5F8andHF12gF7t7SlqDrGH2EkIsiShSe2GJ/RxuFIxgYfK
 0Z9OtQLnZFCLQ2La+U/Hlie35xGe3ye9vsc9Dq2lxs6LDlCKttPZGfAWTfeinvBYDYiI
 fxbmmt2csuLCtlmKP+2Wk613wOpLQfx5Dwq/yp2wh0Zh/GDgVDdiaOBlgNsebIs18NSW
 Js1x5hhsJjG/n/QNx24mX2X8A98gMfGd8Q7/OKEh0XJ4Xg7S5AFMAiKFcShlV2MKLf0l
 XttdSvc7KWnHuxmNwTMBLU9zX82/ahEOvi/gbOsF6+I1k+WjYyRnWlrRga1A/q869xnQ
 2mMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TfW4psnv/zAnc1AOOFz+MTHAzd1Q3PArM+8GhLHC080=;
 b=GPuxWWWtz9SMhTd9LU35kx/zH4KVy6G0aJWhXjMawedd3djLCWAjhO9JxiTfgKs0AL
 Uv/niNQdzUotpP2z/KY18zuqhtKcDSpz6ek86dsjNWlnUdWml8ce8I7TCRd9itNIqn9L
 6iaqWVwEJfg7n6pGSpGAvSc5Iap5uK1KBHw8QGTAAhn7Ga1LxMSOIaAUMEQxYvjwFzlT
 DYqJKCAxRz9fphbGaXN4FsTIBEkFCpQMV0NxFqebzhnYj29hbMhCMSDovj6K47x+Z7mE
 xO3exaSvW+lgtgiiXUpCYbinDveK+NS+vCkusgtXDTQWUwYMk5i9rpGOfvyPbIXFeLm3
 xH8Q==
X-Gm-Message-State: AOAM530gowpJFdT4niGXy4vz4Fplrm+lixFn0UtdkYGTFwXgOlnewl/V
 rYmiZRSrnX+2W9KfLqiBI1iuE45Zhdg=
X-Google-Smtp-Source: ABdhPJxmXM6vb2apg0VG31QfN1pKa9V5PLO6ij3GvmAoDs2qT63d7kAKZ2TT660VeIPaPSELNeaK+A==
X-Received: by 2002:a17:906:2649:: with SMTP id i9mr2488275ejc.1.1631182919609; 
 Thu, 09 Sep 2021 03:21:59 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id cn16sm808571edb.87.2021.09.09.03.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:21:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: amlogic: add support for Radxa Zero
Date: Thu,  9 Sep 2021 10:21:52 +0000
Message-Id: <20210909102154.22710-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_032201_895569_297AF5EA 
X-CRM114-Status: GOOD (  11.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the Radxa Zero SBC. The device-tree is loosely
based upon existing support for SEI510 and U200 (also G12A boards)
and has been developed with the 4/32 board configuration.

Changes since v2:
- Add Rob's bindings ack
- Drop interrupts from wifi node

Changes since v1:
- Drop flash_1v8 and use vcc_1v8
- Rename dc_in to ao_5v
- Rename vcc_5v to hdmi_pw and drop GPIO control

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for Radxa Zero
  arm64: dts: amlogic: add support for Radxa Zero

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-g12a-radxa-zero.dts     | 405 ++++++++++++++++++
 3 files changed, 407 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
