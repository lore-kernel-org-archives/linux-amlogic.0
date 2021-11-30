Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D80AC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 06:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iU2gVEW6FST6ZfMum2AZnbm9wVGW/zr5ekzDHI5LZIE=; b=Q3/0GVCBHFBuN9
	p1wx1A5oYaEtrC+WVDpG5u/2NLJCl20Rrm2bEowG9kB04ldtv2M7vguAHSvB6RKR0AbhSYTV+NVi9
	t5PiUvOKYmO/Vs0+IwN9ui+PKkV6rFHtnzCeVy9X/IOH8j2hYIdO3KIkEDbNCvOkOe9ydWE3n9BlI
	tWvURWPt/wU7f0kAODpJhl9dZJZbZW85ts4UTWMp46vE4GOonKATk2rJdBTYb+3gO42FJZmy9SVfB
	YezVknlltjAL+R1CrS8iuAwi5/mbxzr+pEMYaTO59RGi5OEApvfLOediEljHuT2UzxxW3OtH2OhRw
	gcWKHZdj6525/XzQ86KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwKM-003jo3-8E; Tue, 30 Nov 2021 06:09:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwGw-003i0N-Fu; Tue, 30 Nov 2021 06:05:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id z5so16826131edd.3;
 Mon, 29 Nov 2021 22:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mSfwdTuowBoVvuvpRcPGqlDXwM2nxJRRXCyIh9InCYY=;
 b=AwRntRmqbHGcyAGSEwqYxzYsQkgRGQ4aCUr3PAhSxnxArRGceB8+aa2dJDN4FqS8BH
 MxR7Nyip14QhNvQRz78w2RD9BZEtkGPENYll6q9/TSJuDonHZ5reNn0V2SlGwM2W8qZJ
 oIVephMDsxdh+8u7PCG06YDxCZZlSYnnETcK5OsuVdLjB50HFkhw4YkcQPkTZoZdmI9R
 zAZAllYUystEU2gHLxqaDOxpoght1XYSjR6Yqiwl9II7BOdQRHQToLDs7MyH89cQ9zCq
 Ou3Oeztnlx4dHMqQg0OQwDYlZ8p71A1/6o70+TRW6ImeKS3CygZuWAOhV8RS5RNqAVc+
 ABdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mSfwdTuowBoVvuvpRcPGqlDXwM2nxJRRXCyIh9InCYY=;
 b=7jLUYuK1MoCsq9dUm9mIW4yvLvBnFtJsdz+/xXP0caMgqYLrlm791/bcvmaPZJjnU2
 SN9zErLTB5PD7/A/4YS/3ghTyVsP0emK9aryq/Lr4NybshPi6/gyxfcPt3bDNZxk1jkv
 OkphrRNPHWpLnkSUP+72ZgcFuC6qWP+iSHNEEwnwQbVkwAT9RNBP3ZCzA5roMOpLq9XV
 iaaeIj7caKRcm9Y4NkwUWm6qZfaWNO4GuaUQ6bYJVXFKLRq/IDy9uPqkhrKPGI/ZmJ3y
 n6paqf42O+Pbvrb74M63fEayXby7ltTyPYYs4XmgxFE/n20MDFtPBc7hRUgjPyXJB1qP
 3RwA==
X-Gm-Message-State: AOAM530SA/FfsWbYsatOpR6iFTpkT8YG7Y2wRlChjr4OVFKESVbekWYi
 EN/metpAeh3i/Em02DVriiI=
X-Google-Smtp-Source: ABdhPJya5IYgjH/dB/ngpX/Q8OqWzRA0PfqqnZW3uKZVnfaIikNkbhxKkxoDZ/X1QyHMEN3iF3QtLw==
X-Received: by 2002:a17:906:2f09:: with SMTP id
 v9mr66363303eji.163.1638252344669; 
 Mon, 29 Nov 2021 22:05:44 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e1sm10542153edc.27.2021.11.29.22.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 22:05:44 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [RFC PATCH 8/9] dt-bindings: arm: amlogic: add H96-Max bindings
Date: Tue, 30 Nov 2021 06:05:22 +0000
Message-Id: <20211130060523.19161-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_220546_565868_FA6BA0D4 
X-CRM114-Status: GOOD (  10.33  )
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

Add the board binding for the Haochuangyi H96-Max STB device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 1dc793eb35f4..1e792feecc69 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -177,6 +177,7 @@ properties:
               - cyx,a95xf3-air-1000
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
+              - haochuangyi,h96-max
               - khadas,vim3l
               - seirobotics,sei610
           - const: amlogic,sm1
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
