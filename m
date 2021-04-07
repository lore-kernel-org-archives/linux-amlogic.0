Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E046CC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A6D613C2
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A6D613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdEr3y1ZD2XbcY+BV2NM8rAh8sZQFnXShVjCKpN+wnU=; b=DQ3rXO73TowtWWPhoGnSpCf+8Z
	a+sOZI+aBWrlIZP+tN3fePEonHAtstZIgHmU74viM5f8O9acEdwnLIqFUR0fCzj+XKG1/5T/e/7i2
	pV03/EfdPkChMTgJH2VN/jBtpq9uxmzX1U6JCBdGOsV1iMXm3cJO7kSA5Anw78JXEgHvlxx+XFf2k
	b4ph+oGhoj9R77RXJ44S8UtFBC5lLa/Eo2gEl14d7HHD0a1cNxupL/UrJBSKizfPdp9kc0Y913zAR
	gH7UGRUyv0V8mXA3z/JhYe0QpH09/eW5elp9RerKa0z4fTLWRbZnaZWl6t1GuzHnzVxdQ8toR0asu
	6+T7UI/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTzmi-0041Fa-12; Wed, 07 Apr 2021 04:27:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTzlj-00417o-Qq; Wed, 07 Apr 2021 04:26:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id a6so10374473wrw.8;
 Tue, 06 Apr 2021 21:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NAA73BHK2onrx2B6pnnkviQI+lx/FL5gWOos/API620=;
 b=i4w+E45V86W8zeaTOHDEzZtxpR37iTqe3f0VnGnqJYeRUmBcuBP6rQdMTBbE6WBTq7
 Ni1RBl9rDs8lIjFoFqto7MOb4NfE/MJdNuzVL9sxuQVbSDbLxLa1fJEUSFt9aKapuqCS
 g1qoovyaCa5NSH/uffGucEDQ+vTyz5UKTepLQ84oxMvI524Fygpn1uJoB0PrWjclUQIZ
 XT5jsEsHNzH48a7MqGpZjtYhUkoVVl+tz2dvA2iTazrYvkwjGpTeE9lxlRcaeGBm6zRv
 YbiIg7wWsjk+ATUtRK0n2cMYX6H77FM79z57BakoSj78h+NqxJ1YXLZUXg2jIJ53k56u
 zCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NAA73BHK2onrx2B6pnnkviQI+lx/FL5gWOos/API620=;
 b=YTu3FEF6exTB1yPzDUZ7jlTU2LYBgWFGZfiMy6WcqFvSnFdg0eDN+2gBtSoQQAO4pG
 CPXEHS8e4cfcxAwt9BsM3uZDojZP3iOssrZstCphNXZUxO5/xRGRyJbpCnrVqpSM24k5
 xa1RvWjB/HNKdAIjHmC4Pvk97+tJiT9S9evwyNNa1kAshQ9tuxPfWCh3zTmJgnsWSDgB
 4u448yV9OStUBKQSTpHQbyCNpc6XCDpGzX/dHsGLshC4Hlf1SiPyjQ1T7zR0LeN4gLpD
 Kd/OXQnS5YgoLkchkCqi8xyawvwOqAdatE9Mj2GS3DApLIRoEm0liyst+tiMG3nblMEE
 xk2w==
X-Gm-Message-State: AOAM530lDe7SknBp2rSma2O2cU7dE2YnDmA122s3PP4taP5XDHxETZ25
 BgvSREGjA1bmaQhxcX6/3PE=
X-Google-Smtp-Source: ABdhPJzzl2KjectSUjyCvsMOLhRE8KMf6RwofThQ5+Ei7MP+RMlbSBh5Ey0LoKqTwcKtrNts3P1x9w==
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr1086850wrx.182.1617769575873; 
 Tue, 06 Apr 2021 21:26:15 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k3sm16487112wrc.67.2021.04.06.21.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:26:15 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: meson: remove extra tab from ODROID N2/N2+
 ext_mdio node
Date: Wed,  7 Apr 2021 04:26:07 +0000
Message-Id: <20210407042609.9736-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407042609.9736-1-christianshewitt@gmail.com>
References: <20210407042609.9736-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_052620_294328_AC75B5D1 
X-CRM114-Status: GOOD (  13.27  )
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

Remove an extra tab from the ext_mdio node in the ODROID N2/N2+ common
dtsi file.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 58ce569b2ace..2f8d574c30c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -410,7 +410,7 @@
 
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
-		/* Realtek RTL8211F (0x001cc916) */	
+		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
 		max-speed = <1000>;
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
