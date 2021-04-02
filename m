Return-Path: <SRS0=5jQr=I7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E072EC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Apr 2021 06:45:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85FA761103
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Apr 2021 06:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85FA761103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kafUiDgh3wHMNqE+p+zWl53LjfvcLSG2cvUdym5wSS8=; b=qshjCtM/ehDxEiDZfNQQx1ovsH
	AoC2C6ANq0TvvvXCtWWuwdwWNHNnlwzeIGWgGNmf7FRB1M3yXgOPSxCKoY4Sl8lMtFwefPb/k3Lv2
	BF+QpuTcioTuCd1hSO+ZtUr7ry5smTtxopfOgO+BtijTDrI7WQRbdTe+rxlr8Wi887z8Y3o1USfLj
	FOgxL5wYBaPCTdKrCJ+1Z3LRb54vCaIZpKgUSt7Wuc6ZewCqY7w0yoYN1v+JqaOcKG47mLNfwFq1M
	wfOifu119txgMTer3Jq/SrtoMDQTCbInRkP7ZXvpwByB6g/NeiG5F+dremXyVZCq5b1eAzW1LVfH5
	PRQYu1cg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDYu-00C8Fp-GX; Fri, 02 Apr 2021 06:45:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDYd-00C8Cj-Ak; Fri, 02 Apr 2021 06:45:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id x13so3870949wrs.9;
 Thu, 01 Apr 2021 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZeHJob2v/K/CaMbyyAWcKJg79Pbk2BJVjHV0z+90W88=;
 b=Ca/t4hzjjq66+TKHWGZebJNSM9ZFmjugKYb+ufEu1KBPOmGgMRor4xIJ/HP4TGuzQH
 tpb1O09F4TQ+4P9Iv2H5vKHIRWeSMB+QU0w4UtsS3aAA2ji5fWJBAiv3RR6sqdhUb35U
 NhFbc9BSdDZX5WQPZPxbmY8tyhrOxj5lOxY2kH7O5i3Slp887MYk2UAXZbKO831vkVL2
 BU+IBcLMWI15Rfy4Dmk1wTy3lnJqh13JpE94AaGWaS0HyygrsLLTpH2WsKeYdhFLCNuL
 AsTtlUnf0xU8XBL9wyaYNLAxnhscDulUq1kaKe6t3OdIuQ3FN2agf61yIb1lCwfS55OD
 nPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZeHJob2v/K/CaMbyyAWcKJg79Pbk2BJVjHV0z+90W88=;
 b=XBPlIjHE6jr6mGThpoEtphZEv8yV4xkBdMfhWxgrOHBh3xA6Bc/Q0arkyYhGybc+DJ
 yOpXCkAAHgKLQ6mg1EyPskjIl/xSSdLpAttq6xz2Px9Q7JvHqdoQpOIjoRzDYKCmC618
 toJX1RcOGPWqVxh6ZScPYdncUussCFovF2bDKT2IOB+CdOXLPm7YMIieWlkPijVIp5Ej
 Xd+E5or1Tt+dfJwvF7vmrzrZ9UCtWkrYXHBGE9kmGyp+QylKWVhfrbFsHJakD7Tl5P/r
 TFnEfHJwySnqZw7yAJtFB/nrPAGNJyl71qrK3UaVSn7Qy/UUBEG5BUm1Gf2/Zne+wZEB
 6j7Q==
X-Gm-Message-State: AOAM533o/fI/RbcyM/1k5SwD3OWAFbarHYq2hIV1X0vyu5c7tnLPqGRx
 /n02xln7JQZkqDGmM8D7nlU=
X-Google-Smtp-Source: ABdhPJyYCI8e9Fk+PhwRSOIztpbdqLiUeyuSef8CcdwTahd9XaEWvsGbxrngaMYYo+9iKVTZOJIPvQ==
X-Received: by 2002:adf:f144:: with SMTP id y4mr13901438wro.408.1617345926043; 
 Thu, 01 Apr 2021 23:45:26 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m17sm13627131wrx.92.2021.04.01.23.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 23:45:25 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: meson: add support for MeCool
 KII-Pro/KIII-Pro
Date: Fri,  2 Apr 2021 06:45:18 +0000
Message-Id: <20210402064521.30579-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074527_473279_461C064E 
X-CRM114-Status: GOOD (  13.41  )
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

This series adds support for the MeCool (Videostrong) KII Pro (GXL)
and KIII Pro (GXM) Android STB devices. These are quite popular due
to the embedded multi-standard tuner card (which is sadly not-yet
supported in the kernel). Both devices closely follow the Amlogic
reference designs with keys/buttons/LED details taken from known-
working vendor kernel device-trees.

Testing was made by Drazen Spio via the LibreELEC forums [0] as I
don't own either device. Since dts files were added to LibreELEC
nightly test images I've seen the number of active installs grow
without reported issues.

[0] https://forum.libreelec.tv/thread/23590-nightbuild-on-mecool-kiii-pro/

Changes since v1:

- Rebased on khilman/v5.13/dt64
- Add ack on bindings from Rob
- Add reviewed-by(s) from Neil

Christian Hewitt (3):
  dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
  arm64: dts: meson: add initial device-tree for MeCool KII Pro
  arm64: dts: meson: add initial device-tree for MeCool KIII Pro

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../meson-gxl-s905d-mecool-kii-pro.dts        |  86 +++++++++++++
 .../dts/amlogic/meson-gxm-mecool-kiii-pro.dts | 113 ++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
