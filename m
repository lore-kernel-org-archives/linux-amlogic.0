Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB426C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsKhDwfZ+PQNs6mN0So9Thq9bEWuoVBlJeN4M6szkdI=; b=kpsRNfzP7nPlpD
	saKditmtS0yzMXPNH7wlndAZ1f0LSgC6KwjeA6cSnbT1A2wPvQL8Ro3TCZ1+57ASUVF59xdH+Dl8A
	Edv9rncXpW3gvX3jiG//+6+wh/2IaIsds0SYZrNkDzv+mcGCDwaw26fzqgjUkPYVk3OzkYnHQWbcf
	RpQeV0Y8w6D5NW7CKlRtPxE1kIiIHN6ufmZ1p3FSMYWKU7A+rLhXBEMZq9kyAD0lUEQsi3Ha7DWHy
	HdIjFxcvuqAdjYRtoQ8VD2UKpxQCkzkJ974Ee97n/pWqgBIIXlJm+gmI97JommzaZn8N46t9YBgWy
	RmSE6QrkVXQR/keye30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TPj-000sdh-Fu; Wed, 12 Jan 2022 02:31:03 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TMO-000qYQ-5k; Wed, 12 Jan 2022 02:27:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z22so3837417edd.12;
 Tue, 11 Jan 2022 18:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q2pienCXnr3sbjoYsVwKnMqiOo690+Zk3T49WvUYDPc=;
 b=c9ItgbbMGthyaKniMKKLCIerAHmSHpaPkxUYIjlFznkg0pePK3WISUTlr4acJuGVJo
 kJ5EAUoLcVbHSOtRr+AIGtxBN+MlW1JNGYbzzsPPGqwtZTcQ2AbcRFOom4vG5Ekis3Cx
 +4KT2B52RQtu7KxPNSQhONEl1xBbYmamIrxQcI7R7p9CllENDH7YlcsDoB2jSnIO2Qah
 AqmsoUwvDTJ9tk2rOF+TumQ/PJP8PHXZRDJFip0ybw74sWkj9cfMqLMjBhkBj0SjlE3O
 e+AcGA+OLwFERa0ZQajJIg5+hLNpIFTQ8iVB/my4h9UQr0rLwuNqN8Ns3AmDGebwYvZU
 Subw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q2pienCXnr3sbjoYsVwKnMqiOo690+Zk3T49WvUYDPc=;
 b=J70+fLBy0qsK5Orzj8ECYgG92waF+iGkdnMtn/wZIH3Qe+hULgMCRwWzntkNkiviYz
 sioIc5qcP7IsKIrUPOCDA7OL/TysFRLpyrZfNeLgZI1sbjtx/senqpdaNxIYNfAdhMIC
 UoDwjYJnEZrjCl1rEylS3f6k4GFqo7Jaz+a3+O/z1/J4vCEAlIaAMu03d3BsU6/gqqjo
 +1gxkKf6qauxVVG91Tlxmqdod4wHuujXAwT7CprqaiTxWRzXRt76fuv2m2/0sDKyyDt0
 rBgSNvxNwS73STHbpkMq1OP1fuyVRGB1dhkXtJtNFArkqg8kuAxUVb0draQvVuwAhwD9
 KdmQ==
X-Gm-Message-State: AOAM533yiIxy4NCJZ47qsLKRHXyNGChm5AfP2gQHhGlK7BPK7KEeQssw
 JdPmlDsSgs9k1Vv8LQ6A/f/7zW70D1y7vE27
X-Google-Smtp-Source: ABdhPJzbFTWscIOESqfZXRaEpAeEf2ahlpDikx8qBQLZ7bVaB/3GEAD7t4rj+aY32J8yohsDr9vpxA==
X-Received: by 2002:a17:907:a412:: with SMTP id
 sg18mr5790174ejc.2.1641954454395; 
 Tue, 11 Jan 2022 18:27:34 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:34 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 7/9] dt-bindings: vendor-prefixes: add haochuangyi prefix
Date: Wed, 12 Jan 2022 02:27:11 +0000
Message-Id: <20220112022713.25962-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182736_259906_AC13B19E 
X-CRM114-Status: UNSURE (   9.95  )
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

Shenzhen Haochuangyi Technology Co.,Ltd are a manufacturer of Android
Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c9202a101d71..f4160ee3b5df 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -485,6 +485,8 @@ patternProperties:
     deprecated: true
   "^hannstar,.*":
     description: HannStar Display Corporation
+  "^haochuangyi,.*":
+    description: Shenzhen Haochuangyi Technology Co.,Ltd
   "^haoyu,.*":
     description: Haoyu Microelectronic Co. Ltd.
   "^hardkernel,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
