Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3766EC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:03:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA4021744
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lj2s0EKA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNUzb656"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA4021744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fn6PeumDIe7G10YgR0nQoOCgK2MLphxk04FSLaIeIn8=; b=Lj2s0EKArfUcA5NSDvmu5EaY6X
	W/ppioJx7aDS/BErFA+ccTbD5R80AmryoNfYWx/X6CQijXzZz/xOjxPVJ1mSvykaJYPUmj+KDADDZ
	Jr8WQgkG8z4E/cunwlST2eeY5+RkrN8gxouSrmHQdfK0NvDluOrUFYw5yieDWnvycF74cjslJcf8m
	TtM1+6vleJSThk5p5c38brpaRYH6wFhcV4qBHMBvihYIQyM3nb8p5ayqsGjKT1QCF3RyoGOTQgGKX
	SmgfjBUR/9eT29NgZ+oeQ4k+w8XZizlZgYurz+0o1w25vK5y960Z6W0RHQAEKdoCtmTGoWSp2Dvvo
	700xp16Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1jkd-0006TX-1g; Sun, 25 Aug 2019 04:03:35 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1jjV-0005fP-2D; Sun, 25 Aug 2019 04:02:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id d16so12691791wme.2;
 Sat, 24 Aug 2019 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pvW2fAe5qKhI+32AuCLAPIq8InayZWwjBPViLCnooBA=;
 b=YNUzb656fRAp02e6EEjNCbourwaslTMlBfdnBZy5wc53xGSYuZGIQs7JrIlbea2Ugd
 JCJaKvCjo33MT3ZkPK7p4hvKqnrDLmPtCkIX1skl3nPAS2pm28ktEL1cGvtLu5gUuCTL
 SpeCPIfLBsDnp24rwx7ZvHv2QHx+oxy7oKISEvsBR5nq0JXelIrFASyD6L/xW+orfsCs
 4XjG1JvF5NHvvPv51TgA8lFj0SQSVfAECmw8InYZkiLgWZpoOa9/I8HJGPTU2pJixc0T
 9F70iMW+nudCwXOtIT40A/Gw2g8ZMiNPfh6W0y7vfwxzsKrJ7mDWdJdmAoC+VrZyYvCV
 1rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pvW2fAe5qKhI+32AuCLAPIq8InayZWwjBPViLCnooBA=;
 b=cH5WbYq3fr0bLuonP9MbwFnIAJZ+EJi/1EGNlHngA1ofwXAOSDBba1BM/qaCFHuPi6
 5NiYzVkre/hsA/5Ii0NvEyG0Ii5OeRezLe8exU595H0/meIN+t2aUTkNkfxPg4PL5DVq
 NDSch+/RemMSMGkLrYCbQ7jLBtzZPB8WFQvU10y7qjw5HDJM6RjxaczGHHefAb3JZ8nS
 KsmY/kKkzOrfg2X2SjCzqIlfZ5Qgpjp+iOOjhDTKu29yJaq6AK6eBZbQu1yyN92YtPb3
 ZQIUQmk22DPy62VAUe3lIHeIFmERu/0mj9n/097ylpJ7TG67VBE4k8ohzLpY8+6XW3Js
 dKJA==
X-Gm-Message-State: APjAAAX/qnRt3hIJQArQz9vspbQU95mS2IrcNq/haeVXorLqda012rk3
 S8qNUive5VxOj06Hhj9WSxc=
X-Google-Smtp-Source: APXvYqztzIJKlySFmdH9BdFnbtrF+f7KI5MphOF2Nh6m250q3lZ/+sKv+4qCnuRAgmm6p/IffKy0hA==
X-Received: by 2002:a1c:7914:: with SMTP id l20mr14162802wme.130.1566705743964; 
 Sat, 24 Aug 2019 21:02:23 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id a6sm6820985wmj.15.2019.08.24.21.02.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 21:02:23 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: meson-g12a-x96-max: add rc-x96max keymap
Date: Sun, 25 Aug 2019 08:01:23 +0400
Message-Id: <1566705688-18442-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
References: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_210225_115500_89CDEA4C 
X-CRM114-Status: GOOD (  11.76  )
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

add the rc-x96max keymap to the ir node

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index fe4013c..357d7dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -277,6 +277,7 @@
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
 	pinctrl-names = "default";
+	linux,rc-map-name = "rc-x96max";
 };
 
 &ext_mdio {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
