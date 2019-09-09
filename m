Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4C9C49ED9
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1E0218DE
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZZGAO/z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYHTVFkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1E0218DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QjoI7oayxcD1mca3GPl7I7lxXYPj2mVd7qKIpPxkhfk=; b=BZZGAO/zcgTa1rgtaUyfruh4Wo
	prRKJGRMN8vsET83cmug8jKNuv6nm1GZUuAXelZL4+QAccpAPYIGp2y7NJ1hwVXh6yCeSUpApwv7i
	AW++LTkftCfvgD6D5BnaeRTnaL2kF7dwwQ5+9AA61BnUcArXx8rpfV+AUXy3x9Se9iPKBFb9bdTZZ
	VKrqepni9/EROjNImZDnKE3xwEXJ2R/wMcN4C7RBT+MgBU8tD9+eMUqG+2x44CEV7bV8kXdZcX6Sa
	FqHrTBIzGvh1+djIaZuVz9gkwQQHAacA0cAg6rtuGCUIiOEZGcHD8Pt/W7kP8N5NCnk+CceXIPwIT
	GvnXZS0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7LDA-0002ZC-SD; Mon, 09 Sep 2019 15:04:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7LBW-00013H-Vn; Mon, 09 Sep 2019 15:02:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id i1so13646328wro.4;
 Mon, 09 Sep 2019 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X2M403PGzeHsgRfWBo9vriBLfSezzprBCgW0woIy9ug=;
 b=GYHTVFkcpkNuI6btoryG5kJHIVq3FGm7RQG6Kt3SOKd9P38AyaGq+dTvlsDKvUyWek
 A3Pv3+LOSbh9y4yZM5QuT9aH19qUYHWsZjRExqhN1KmM8oZIbbd98hOPI0Zw9+jE/i8U
 aVYzbE7iNoQy472GtVvkj9uyfg3YhPqYvbJ7XVJcArQtncN5RHk6kOrIL3olOO/cfV81
 V0rRXjOajeXMr7H+3GsHen/EgR+7zEJDcOfnYoUYXnXPagQlbpzNbITYYg+b4dG61QIP
 N+xj4woJHg/ZIcxiYpWA0kE09rcyB03Jm4sW9/bRkmNQHdiCIAGqFl7OsyceuU7bFrIa
 nC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X2M403PGzeHsgRfWBo9vriBLfSezzprBCgW0woIy9ug=;
 b=AvvwFOpSyzK5BiJkSHW9fmZOZzeKIBe3ts4ZXiMsN57GEz8bJ8L2C6P1xh8irMWQq2
 0BPYHBWDpkLKCJDxaJpU15QsP7Rt26ObDOC6MltAFYuzCtpwORMpwntQubEvXgbDAQ5S
 RhzJ87dDhSc/yj3O4fqlQVcDlM2jwPnIkEmHI6xu6feOCDP/dbq6Fwjjfl0tos6u34Sj
 RXFEKVMDFssNUpIeYqiin31NGzvaA/wlwRP67voQGE5P8MgQtYAaOhNWLFJFJAzF/bRu
 nsileStHALw2dsw/NNNBAwTxp192tCHyqAzgx8vsIO5av/p6exHHsEGpIGJp4l6kO3JY
 XAYA==
X-Gm-Message-State: APjAAAXqv6kHlDf9w8yHbHILtCUY5jCebjlYUpKApcWwvfwvhQm2g7VO
 6+gipnPMnNlRVpGoJPxKQ6o=
X-Google-Smtp-Source: APXvYqzDmQ/HWnchUAb8AIL0X1Ko3tv+V7JpQ2AA+3yPhXgaA0+6kuTVTl66RxXE9TlWF+A3mcdY/w==
X-Received: by 2002:a5d:5389:: with SMTP id d9mr19862411wrv.119.1568041349772; 
 Mon, 09 Sep 2019 08:02:29 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id s26sm27755397wrs.63.2019.09.09.08.02.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Sep 2019 08:02:29 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: arm: amlogic: update libretech-cc compatible
Date: Mon,  9 Sep 2019 19:01:26 +0400
Message-Id: <1568041287-7805-6-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_080231_165734_E6063010 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the compatible for the Libre Computer aml-s905x-cc to be more
descriptive using the format introduced with the aml-s805x-ac board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd..b3c9dbb 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -95,7 +95,7 @@ properties:
               - amlogic,p212
               - hwacom,amazetv
               - khadas,vim
-              - libretech,cc
+              - libretech,aml-s905x-cc
               - nexbox,a95x
               - seirobotics,sei510
           - const: amlogic,s905x
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
