Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1DDC4743C
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7E760FE5
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7E760FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kyCI9I0sndTDHYGaSmN/Heu/NDlqxqzsrDdA4YSdrUc=; b=v3I+rrKtM1E7Q2
	dHHTA5vzWiwHXaqKiODn3qWMlPZx66ByknPsK3ZFrK/H2fg4aMj+69KDVwYCmkU9fgbf4jwmMK8LR
	LPHaULXST+Ot2sD6ErUZKl/ZLdLwOTXPQid+PRS3VT3F8ghuA7fVoT6bhodMgxIMeqRB5bEcdNd0Y
	Ozba8UwK5UECM18XZieKUPD27Lc8DSb2mOGMQki3YpKR7kJKF7oPWYCCa1aA7IT7Ulvuqczue7tlj
	lBvRuBBmvAR1S8aj5c0WbLvMq4lMBSAZjH7/UosAWoD1E21SMSYevrOzaY/slPazBsjEO+j3w79xe
	E3jmghU7aq/nEY3vWMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMLf-00Frg6-Qp; Sat, 05 Jun 2021 02:47:43 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMLS-00Frd0-0j; Sat, 05 Jun 2021 02:47:31 +0000
Received: by mail-pf1-f180.google.com with SMTP id y15so8765947pfl.4;
 Fri, 04 Jun 2021 19:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9YWDGtwFEazMTgKTgnhtKVsR9Lwj2c+5ANH5SB580b0=;
 b=JXCnaLKYrC45wiA7LB39WHEfpRZXjDA0VpM+dOMOnd/UbXTZ2ThVmKrwvZXaXAlxy7
 0AOZyTQpFj7B8zCJvmI2qfoFti/D86Va8pPqozHS9Q6Zg7drJb3L8hjjnJ0giJMM41sX
 8Kouc4DxrbDtvVAyXa2Ks8x0BV3QofsYEqaa3cByHnu4qnjdHBLtVkObQ4tC6CDhAYUI
 OMXvV3v2MiFin1OeAJZkAwa6a+exMhh4WzpXo2DzjmNdtVaIgr2VUW4uwaTnQ6tFjMnI
 mm5Iu1bbyCnwgSfIhpzdmUqp6EcI0MKW+6WQX+5CMVoV4rqGXa0onAxh+ad17F0iMVUG
 4+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9YWDGtwFEazMTgKTgnhtKVsR9Lwj2c+5ANH5SB580b0=;
 b=Os5pcNZPh3SJEZa1SuE6yJ9zHAMgVgXw5n2xoWhk3fjID3CIsC+2eVUON8lNkUHX+M
 Auj/cI2BDzdCGKSmJBi3cWRRG0Bj9fOLBFBVI5hO5IslDHTS8xuqyDoishJzP5uwngIj
 xytou9pdMidFvJ4wXbHchvBXwsHg4sZ6wNEnQMF1AOcSd5FWVuEMK0iKVdZ9eyGkAp2C
 e4VEYBijIdbB9CfNou+XQDqeTIDr5dwZ48FG/VOHPFeD3WjfiUjkkC8qFpYJuDmGxLva
 N8GlNepvrL08WMwU3bB2yy5Ej7F6pg2iDgsU0iRAm3p6sH80TFRviorjs0WNGE4cwzhI
 IXew==
X-Gm-Message-State: AOAM532lNUam0i+xuDKCP4TmPjAuTiSpCmDZJS8bBnvj6RNliT4ssWJi
 s9lv+iCHJwJ9+JwN6iM/SQY=
X-Google-Smtp-Source: ABdhPJwWI/5SZk7uOlDPOvSEihuZWVfO0MvMDfknx9zKdidVhPd5fqgYL0Lq63fbS7T5lAIsp1hXng==
X-Received: by 2002:a05:6a00:810:b029:2ec:3b54:6a89 with SMTP id
 m16-20020a056a000810b02902ec3b546a89mr7597353pfk.0.1622861186493; 
 Fri, 04 Jun 2021 19:46:26 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id q21sm2864612pfn.81.2021.06.04.19.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 19:46:26 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim1: update serial aliases
Date: Sat,  5 Jun 2021 10:46:17 +0800
Message-Id: <20210605024617.409677-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_194730_100608_5E9BED34 
X-CRM114-Status: UNSURE (   8.37  )
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

From: Nick Xie <nick@khadas.com>

Update serial aliases for Khadas VIM1.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 60feac0179c0..f116a9d91633 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -27,7 +27,11 @@ button-function {
 	};
 
 	aliases {
-		serial2 = &uart_AO_B;
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+		serial2 = &uart_B;
+		serial3 = &uart_C;
+		serial4 = &uart_AO_B;
 		ethernet0 = &ethmac;
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
