Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88344C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Feb 2022 04:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWpJF3Ygh1dMzi6OG9WMDKBsMxL7eWdI/jPJKRADyvY=; b=WyTyh6Hdf1TMed
	cEeSRF3TnnVOwNMBrUws8YDPA2HD17VWamzK8XzNLSHvH0HPJtldbWJYG8nQWCPE8hz8WtX9IGuL5
	ycfPYpGE+gt+xS3/wA7ZWaoqg/yBNTRRI8twtWS89Wgp9DNZIIHVjd7AEpYEBMmwfd+8V1CAW7ofH
	ZzoorDQsljxEodbJYhMYs8lzh9pSVJTLul7QhNvxjKDI7jkSVfvZqTUSUCyxUH+I2XWUfx7OZcEFk
	NgaeQfUpcytQdEWX+nljEid9VtrR1uEKRstIUkruIkFW1oUhtFp/iiEIv8RWpkKdersdrYdTaUn5x
	oe/bEpYNXVLhjgxk9q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI1Mf-002Ypz-9P; Thu, 10 Feb 2022 04:47:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI1MA-002Yei-Aj; Thu, 10 Feb 2022 04:46:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q7so7277310wrc.13;
 Wed, 09 Feb 2022 20:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CINhVeMEJRnxt2N7nzrBj1BDzXGGBYQDuFCYQXZDz9Q=;
 b=jM4fIs9WFGN+yAxLwcMz2Rw7n5SZE+DiU9dTpcsBap7A6Va+CVuICY8STiXAAwNId9
 gtUlfLX/KxgxpGIDonB34zxorkxBOjJlOgUMD7ZtJpNMeyREmYWTwslfrwMfQNGeckGf
 6zbsxERFbaEMHJrDx4ci5dRiLSRkzDK21j4NygrapicI6Mti+Zm66JEbZbNhopSTqtHW
 LylOkS5wiUi+kFPDLLs0Lf9xhT6N5RvFSloOLoVeEUSFDilkCH+gOUOFhroA+tbu9Y6T
 GOxX5KKlz7YcBpfT5GJhmrBCPsgSOROoH4hM2E6XGMqzpOngqAjmk9jvhRIzCpO35+QH
 AE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CINhVeMEJRnxt2N7nzrBj1BDzXGGBYQDuFCYQXZDz9Q=;
 b=7xwrqeZlaWSujIqBivzbKdquRCA7/8978doviK1u9CrKOL5iwL6Ly2Rhqepks/S0k9
 1wnWWRxxXxG+Jcn+sZ5Ya6wuxzW8eL/f3VmHSAotiL7PzBkzh1I6eA38r/3I/79lLxel
 39Vm0VUV+6bvcsq3Bt/UZR315OPL+x41avOPPX+wQASHURDNGZpE9PJi1sifamZ6n5SJ
 Rv7qUqNilYHUhrnVNkX39WOaZWwDHJv6NLA6TbgdM0qvgjjkZ2WgcZDAnFyTzI3B7+DO
 3D/rY0PqODnmjbwglybQuH61WkU5/4VE6ZRQ8Ciszkh89Ev0BtUGTry56edQwQJplwI7
 inlw==
X-Gm-Message-State: AOAM533oQ7rZJe0LMzSkygGR2TYw4pT9SGHpnbsHB88Kvbdlju7Q1Tke
 nYufF7ZFSGjeEmqVXRhwun8=
X-Google-Smtp-Source: ABdhPJzMSDhKCtHlwy6VUTO3oQMZNo/xnWU8iYVtBLY77RIa9onkmuFf0FO3SP4Gkzl1RllgvBTm0Q==
X-Received: by 2002:a5d:6e86:: with SMTP id k6mr2441841wrz.388.1644468417203; 
 Wed, 09 Feb 2022 20:46:57 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h17sm323089wmm.15.2022.02.09.20.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:46:56 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: add Vero 4K+ bindings
Date: Thu, 10 Feb 2022 04:46:46 +0000
Message-Id: <20220210044647.14443-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220210044647.14443-1-christianshewitt@gmail.com>
References: <20220210044647.14443-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_204658_393237_1302123D 
X-CRM114-Status: UNSURE (   9.97  )
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

Add the board binding for the OSMC Vero 4K+ STB device

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index a073a959232c..61a6cabb375b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -108,6 +108,7 @@ properties:
               - amlogic,p230
               - amlogic,p231
               - libretech,aml-s905d-pc
+              - osmc,vero4k-plus
               - phicomm,n1
               - smartlabs,sml5442tw
               - videostrong,gxl-kii-pro
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
