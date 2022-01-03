Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDDDC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/sMYyD3oRpB0eRbAIOwr1+uP6/5gBPSjQJw84otMQ4=; b=J3NcKjTICgBIlE
	dTrntbsFeSh65fOLIETrdZh6Yn3xQBP4BsLvi6mW8czGScBytADfswf/sLEIwH2wHZIcS11bdetm6
	MDZFHsacQ+oiF+bpLJboXkbN2pbAAEFBvJkp0p/ePfi5+y/4z8CnYQl3ilqdgtiAu268cSyFcH6O0
	6UC4fjY7K/AkIsqx25gRiEF9AvWqHuNl/V2UMgrwbMMjZzsBVbAlObIgsBnzdNBwtZP7LDz4I5yhy
	MaIQvoqNf0NLEfqW2dFajXfFKVen6xdvezYAmfZvJsoftjKYuTal1zI9QJzzG+LPLT0AcMPp1W9uA
	C9TsZ8Ao4mMH7+fwtcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QOV-009UO8-W9; Mon, 03 Jan 2022 16:41:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QNW-009TqW-Td; Mon, 03 Jan 2022 16:40:12 +0000
Received: by mail-ed1-x52d.google.com with SMTP id y22so138079791edq.2;
 Mon, 03 Jan 2022 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p4Yz6c1pIbz2ITxrOQWOyCbFEZFiExtqlrCSzsvDykI=;
 b=J+ZdGNr8AkYghMKpIa3F7mCPljZx6ryO68WZ/pbDDoJKaq+8z75X1JhzdzfDrCkrPJ
 Na/ttxLv3itVV+pn2WmtFRFE3oIpf/YJv9j+yqs5S372C9ENGcWVTtn9OfP2Ong10qSh
 pWoQumzkRURyZ4n/P+sOlQih7n4BQkdVlORGRdihGvCiMFbXiBDUE9LFEM6yr+KIV89l
 BfPGRDTqh5Y0GDvInLBoMEXkLie3G7TxkCe1IE5wSRa6J7iZc2kiWI9PUv+FxYepMHu7
 NhMFtpD6Y+EuoCt7T4k6Xi2NlVpfytm8IKLWAFMl6H4KNIE6jZTA+WrBRHFCEpOhY8gP
 oHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p4Yz6c1pIbz2ITxrOQWOyCbFEZFiExtqlrCSzsvDykI=;
 b=EcU8jCGpw2A1DKraE+kZmaUnuVq8AZM5jx0MBm/sxoobBdPNsfXtkh73A9sCca/wqm
 WA6tdKbutsYNI3sj2iWxGMnRBXOJiPTSsA+7BDSZ2uj3kRmE5gJKTwZMsD+9REGceqZl
 kcoW6wo47Rh4WMGh5M/b1FQxDIRKQGW62xoN63AQ//ihfPs9IcgQeRzAwckt+kn2dkEG
 6F1xpfUw+tFZWhnSF+/Mh+Ejwl1p2jyFk5augn5C0S+Ifdqx3eRjseIgoH8quBjX6hoL
 6Yj/hGzhftvFVCzP69XiYBkn4N5QM/w3xl16VbrQqPHQPK7jFOOqlxtCIxg3ijyKRywF
 BKPQ==
X-Gm-Message-State: AOAM530vJVzlY7zns6RuFmDulA5p4jBylV8V7vsJMDHN3gvAcmKq4dhU
 vORxBRZ7z64bCmsEBXBqFhY=
X-Google-Smtp-Source: ABdhPJw/HvxGgBV0K7DCOi4nqHrbVeEoolbUJBcxbFkyLN8rxGHcFEo1XNTiTLe3POPYhr7uCOey9Q==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr45465632edq.252.1641228009502; 
 Mon, 03 Jan 2022 08:40:09 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id oz20sm10724068ejc.60.2022.01.03.08.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 08:40:09 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v2 4/9] dt-bindings: vendor-prefixes: add cyx prefix
Date: Mon,  3 Jan 2022 16:39:51 +0000
Message-Id: <20220103163956.6581-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220103163956.6581-1-christianshewitt@gmail.com>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_084010_976610_852A0C69 
X-CRM114-Status: UNSURE (   9.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shenzhen CYX Industrial Co., Ltd are a manufacturer of Android
Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eb8ab0d82198..c9202a101d71 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -281,6 +281,8 @@ patternProperties:
     description: CUI Devices
   "^cypress,.*":
     description: Cypress Semiconductor Corporation
+  "^cyx,.*":
+    description: Shenzhen CYX Industrial Co., Ltd
   "^cznic,.*":
     description: CZ.NIC, z.s.p.o.
   "^dallas,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
