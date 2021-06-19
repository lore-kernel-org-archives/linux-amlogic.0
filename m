Return-Path: <SRS0=FilP=LN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C718C49361
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:40:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6A161001
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Jun 2021 06:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6A161001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L47y1e8NdS1nUI1yG1N2sNwXYp7lqvDh8g4ofIO1rlU=; b=tBDd3s/HEhKLTQ
	+okQQQopK5iUkj+62tjh909gRsNahfPjmlnFmCuvK2FXdY5ivgsGKKmS2ITMncXB9XYRkoCmHdMya
	b+XraqCPlYCjW1eliZK1ONUyfEKWitNAIyUgnjMDWcQbvOl+0f8lwPCnFnhSBAd7d852Cv2I4iQSk
	nPX2kBiuy6r7htCSodGeoa16u3HlGC0rW66PlGAtELggXFGja1zTJFWdAm7s1M8jd9k3qZlU8j3lI
	Wyeer4KS50b6zViCcLH05lOqC3/16qgFpoyZOwS6ax/7INteaqQQRafHmlbBEwFo8UD7FYgfZ0XyZ
	e0zHWdtVLSUfYS+ro7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUeU-00GUdZ-HF; Sat, 19 Jun 2021 06:40:22 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUeI-00GUbx-3R; Sat, 19 Jun 2021 06:40:11 +0000
Received: by mail-pg1-x529.google.com with SMTP id n12so954320pgs.13;
 Fri, 18 Jun 2021 23:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BqdgBHlkY5WITeFSr4aT0Yb2yF3TJEhWLYU++k4kDc=;
 b=OyJR0Nfb8+QGn3KzeftqpXXNYZ0z6y3vw7+jeGicalCGyi3T9Q8LWumQqgoCXEPvMw
 6XAifQxgt9eFldC7SIU4rY10qlaiVWmXAW3Xr8YzP6ilEfvKPXWeaDTYDyExHtcp92QS
 MtZC6OYe4leOWMObtezIaKH7diNPzu5Y/1PVVKcbWbOe5KB+yyPCbNIp7/EOn+mxwlAq
 HSV2nCvbDPH+MKISoDlABO4wraYUqQVkVW2ulFqAEWSpxeHxACOCnspvNE46/FcU2Sj1
 bMQ/2i3fDJ1R57h6lwEskSF0F0jmVKXeSNk00LzJJ4+KccUuL3uFt5fK2lAxLN4K2D0+
 kozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BqdgBHlkY5WITeFSr4aT0Yb2yF3TJEhWLYU++k4kDc=;
 b=GWLqAifAucaAsLA1xIZtU3euA2lPh1Bm1RaNGSGjYEDkFybIjwXflfMizy2Qdcu7aR
 Uv+motiApnAfSuWJHZxs+ZBQlR1/Iuhgt5ZoV55ZfvGEPtwOl1powiNFLVUPbDafsmud
 irVuLgjpzmQBL8Jp5q3sMXh4h2UWS+qqHChDljZbtszv8fZ66Wg4qJyFkYIXsPGX2ofE
 iRGEoS/dZvmrfUiqEkDf500ssrNQnLogrnqA6yFMyYHfTMpHrw4Qwt/8fxeyixPtxMyh
 R6UyRtmPb+JCCqkcVwSx9oV3oPY2XiJdqtA+ErgrnIUfUY8M1p/QSmCvN6szOhuliZaW
 PeLg==
X-Gm-Message-State: AOAM532A3P1j+ShcrdfWUQoO//+bt6hF27w9TuLNFRfDqcWy2fHgutr3
 FXZY3AMXDqCbU6Q6o0LbvKw=
X-Google-Smtp-Source: ABdhPJx6qUHdAKvNLGs9CTuBE4CgynbGRylM+XJL0CFH/7p4Eml/rzSVbtxAj2oJWYngPavAiszjFg==
X-Received: by 2002:a62:1942:0:b029:2e9:debd:d8b1 with SMTP id
 63-20020a6219420000b02902e9debdd8b1mr8852127pfz.9.1624084807935; 
 Fri, 18 Jun 2021 23:40:07 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id r19sm9440274pfh.152.2021.06.18.23.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:40:07 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: yue.wang@Amlogic.com, khilman@baylibre.com, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
Date: Sat, 19 Jun 2021 14:39:48 +0800
Message-Id: <20210619063952.2008746-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_234010_188719_3BA9CCAF 
X-CRM114-Status: UNSURE (   5.00  )
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

Replace dublicated MRRS limit quirks by mrrs_limit_quirk from core
* drivers/pci/controller/dwc/pci-keystone.c
* drivers/pci/controller/pci-loongson.c

Both ks_pcie_quirk loongson_mrrs_quirk was rewritten without any
functionality changes by one mrrs_limit_quirk

Added DesignWare PCI controller which need same quirk for
* drivers/pci/controller/dwc/pci-meson.c (PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3)

This quirk can solve some issue for Khadas VIM3/VIM3L(Amlogic)
with HDMI scrambled picture and nvme devices at intensive writing...

come from:
* https://lore.kernel.org/linux-pci/20210618063821.1383357-1-art@khadas.com/

Artem Lapkin (4):
 PCI: move Keystone and Loongson device IDs to pci_ids
 PCI: core: quirks: add mrrs_limit_quirk
 PCI: keystone move mrrs quirk to core
 PCI: loongson move mrrs quirk to core

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
