Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C793C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 01:44:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204752075F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 01:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVYlWY7f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lugw2ssD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204752075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zj1q576U1jjfjM1vyAIJoGeIS3fkukBJBWQasvj68lc=; b=oVYlWY7ffGtIdI6sFjg5mN0f6t
	dL0pETuCDaAU74K459RPhkUfZdVNUBYU2EQvFAD9UR5ef5hv6BPNnzH3Jd1zR9I5lOXWLe1+8NpeC
	1S4pifSr1po1n/T/A+ZiWAi9DNunopet+cN6dMa/hIgyRCxwP2vhL5GYmf6fOjK2DiQTKMmCbLABC
	NksgsfzF59/PIfbdNt33/Vr6qUQw3OALCHxRSIfBJrVNeoBC9qWBhhmIfl141MmtEnhcwdAa0uIUU
	4cpk0D92TYScH0pHQfhV/k0TX/Wkm1ppva7DXIsMExZ+bOAOY8boneYA1APNZZ3F2dY3MmSPpqdE+
	CyQdjJAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbDma-0005lA-8Z; Wed, 20 May 2020 01:44:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbDlk-0004r7-20; Wed, 20 May 2020 01:43:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id 50so1411221wrc.11;
 Tue, 19 May 2020 18:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bjQbbX91rvnNhlDfTgwfaBNtgngEI5glR7O7U8xJEyo=;
 b=lugw2ssDYNL2LcmLnwPmMdsxe4DWxowyinpMaoTghscznQiRWqC0VIY5uDb9XK2DKh
 BH6F+3TqNj1xdWpMuLVXvNRqcrzU7NPn62eAi0FIICdZNwKliW833pKS55sXILBaippw
 7yq/rA7M5/8mi0AYFGSavd/ww4egz6bdQkgwDkoecin5FhmB+Z3U4OLNrGEWo1/uBzxl
 65ucGpTfmK878WEvbxcKFb4reQXNmy0bd+/K+PuWuETgTCyDsGVhOjSaTVpliLYP/OMP
 tRNwf4tF6UVq49dGbRKrUPat8F3rrph29QoZbuhnvmy9kk34I5aeaD3WHi1f9yQqsPWo
 vL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bjQbbX91rvnNhlDfTgwfaBNtgngEI5glR7O7U8xJEyo=;
 b=mDZgF68QUeRcLXvDU4WJ13fX+i5B0TC6KJ5qrcZ4bx52b+B1EJmAkNMHcQWxZI1EYD
 dkuR3+OhxKUYbSiWTb2NBFLC+tf5HMQaQV1JMnyzuZ9fAE+QIJ7iFUa9fio1VeI+RtIH
 qj/v/2Fr3IpE0a/Zecs0UsvQs9Gq530hn95wsGo7ekmAD3KnDYooO4AQC275MrOgQex9
 Hz32U3FVJ6QaIPQKhMtDJEGbds2s2F8anhqNDjne9sR6RnEadK60vETo7X6S79B79pW+
 MvR02OONWKSNIdprO1qJ9ZZIf597zi4EcBNf6dr2gJt1lFYNHxhsEVHTHiBJDPj3gmto
 Oysg==
X-Gm-Message-State: AOAM530akp0m+qs06GazzBmP3+FRCL9CtUUEdy4oGNGywJEOMxqzVxgJ
 ijX9M5qnooIsKc143Ei2ygk=
X-Google-Smtp-Source: ABdhPJw+8PK/stydHq+zPhT/JPDq8RF8MCxCKKZ7i1pkIox3rB1Kwqp3FM7mdjRv/Qt237Pna3LWTw==
X-Received: by 2002:a5d:614b:: with SMTP id y11mr1801879wrt.77.1589939018483; 
 Tue, 19 May 2020 18:43:38 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id z10sm1493351wmi.2.2020.05.19.18.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 18:43:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King
Date: Wed, 20 May 2020 01:43:26 +0000
Message-Id: <20200520014329.12469-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520014329.12469-1-christianshewitt@gmail.com>
References: <20200520014329.12469-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_184340_100743_ADE147B3 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
board with an S922X chip.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 47badda69ef5..cd7a081a4f17 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -149,6 +149,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
+              - azw,gtking
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
