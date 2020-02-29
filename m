Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49464C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 14:10:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E46420578
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 14:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHNT4PbK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5/pObSF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E46420578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LDgNOTmsTKwUhATJEhawzbMqaamM631LaPE1bP3MbFc=; b=bHNT4PbK/9PHQ+t8FB67FgdIgi
	lSwenPVviNKJwWktcxI+2AvZH8C8ZmKDha/2nqDZeGVbcIaA96G5L/eJKG0iy5gnwIV6892O1zhRq
	c7zAULng7fdcj+wT62n8IkELtS+GWq2DlmDCZtZeWKltNcd0QHCfH1YwuLYS2koUA+Et2JzzFAtTW
	bJhMq12kAY2GrS/rqNWxFFKpNLWQSdbBv3ZLdmEBktAYtVGp+AgcXk7ex1qBx2xDlPsQu85pnp+gS
	CRpFJ69xqK2Z2477xxR7CWKKlwBlHoPX/NeAzYfdPtU3yYjgiySq80PU3hWfi4yypBv+2Q6qWiUxj
	jC1JyzVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j82pG-0001c6-Cm; Sat, 29 Feb 2020 14:10:42 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j82oi-0000LS-G6; Sat, 29 Feb 2020 14:10:10 +0000
Received: by mail-lj1-x244.google.com with SMTP id e18so6546827ljn.12;
 Sat, 29 Feb 2020 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r/iCABg4UBjB++Fm7IMDHmXpxhSnsF+XLYegHsRByUs=;
 b=h5/pObSF/xkpM2FbDhJrj7JLttJODK8r4OoPMORIZnz/ls4WhVKbLzg9TByoKc36eA
 smr8i+k1W1Ap5S2q4FmE5Xn6GW91Y+Is5GcK8IKAbvVdqBgsyWkaBeXzsWi6lhOgxNoS
 8DmO2/MkQqrm930PT9+eeUNV4y86vb0HArssRz0RU4MV5ZfZp1fFNxVGqMA4CEuE9Rd/
 WjBaGagO7Mns+CO+PctTbrqTNrzJPXLnz6SQVh7A6yvo9Fm1Z9P9nowAyeYxy+eObcS/
 ycfjlL4MtwfRrIEq5WWNC0xLYa2GBsJXlLXailljNq9TRHDSb1bJpJ2vgM6jDZvlf8n+
 PDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r/iCABg4UBjB++Fm7IMDHmXpxhSnsF+XLYegHsRByUs=;
 b=G/lbtSGzDpC2T/tubzpV7iWUO8jRluSCplKHyp8fbyzvQ+iQBBNtQKqHdyQ+qo1ejV
 HNHER8lu36qpfs3eHMvwEGf52f1Zn/1LOJnro3pw2gD9JdgeDsE3huoYHGeUw7FFdrru
 OqwK6x1WDWCX5Zi/WF8FbS5DpgVn5FLDYGx6ulAvZiN7RLj0Bf0YMk1Lh6OVaEymVqoZ
 g3Ko4jLqYc/qFlk/pNsB943F6eLKtaRA4phv4nu9vMixjZnqYatfhQaHP76fg6DuuFK8
 3Pa3QqhznNHUqkef4xm1B+ZftC7A0wUd77U3N5kN/Rc9NpzIeFl2a7zp+RUmOXjNWpoT
 pJQA==
X-Gm-Message-State: ANhLgQ3nTAj1c0rIthcKSDb8B+F16Pz0ftSFrR9prRTWncC+Pa18SVip
 4WFQrHSaSybZ27EeCvHyASM=
X-Google-Smtp-Source: ADFU+vtZyjptE2moe72CDf/tXaeElIWg7AMBJ4+wkWWAYrOyrnBfvQrLP784TZMKurcmn6gCvOxYhw==
X-Received: by 2002:a2e:7005:: with SMTP id l5mr5781465ljc.230.1582985406655; 
 Sat, 29 Feb 2020 06:10:06 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j11sm7104124lfb.58.2020.02.29.06.10.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 06:10:06 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King
Date: Sat, 29 Feb 2020 18:09:12 +0400
Message-Id: <1582985353-83371-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582985353-83371-1-git-send-email-christianshewitt@gmail.com>
References: <1582985353-83371-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_061008_573705_F37EFF41 
X-CRM114-Status: GOOD (  11.33  )
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

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index f74aba4..6bf9bbc 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -148,6 +148,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
+              - azw,gtking
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
