Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0CC30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LN1xy4FAraaGyXpLqTfaiBSvsbmNRu/03DrrWY3Mcc=; b=zyvWs064HuNg3o
	3gBZmY1Pd+3VlPXsw2pvU0cgt4y0Ckot3UAvvvZkNPIULU0sV0L1UqWoAaquLbwA/8gZx2/+uVxR5
	FL9ANaEcZ0JrMpvi7ICsYtamzhmI8nkeff8sd7NlTxGbh/1+isM+Z5f5TURTBUoxDcOOkM+KWSVh2
	0WfoLzv+SlPl5sbhNINiKg0Mlq6/gm+RN+0UuIKpzzejqov4iiLXfYKC9prAgPrv/snrhIQrxqNLu
	Y7lSyW6shZm51oU6h46pOMefCnDzLiYkYb0g0zUSTPGp+hXgLAjf4szZgsaIRzsukdk4P1rNVz8zx
	LKHdItceFJtX+gTecW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwfE-00000009d29-3Juc;
	Wed, 03 Jul 2024 09:52:36 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdP-00000009bzl-2PeO;
	Wed, 03 Jul 2024 09:50:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a728f74c23dso589996966b.1;
        Wed, 03 Jul 2024 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000242; x=1720605042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/FFHHxRXCiHESWSSzIR+30DbRf3GOBGMceZW/6eQho=;
        b=m016xaQJyHwxnCpKbvuI/PnMdNfYUl8JyaQeXcB0Aw9lSgqQ2Qw27FT2URByk8y29z
         T1k8C2P7d6EFSKb1lM0aKI7G5ax2QWK6hcZaekwVY46tvdVctYYFE/49fFeTXh15ZsCS
         pFnqt1aQgY8hkRmhDoRbuoOANs4XgVYN3tnRq15ZitfhqRmxeTlfdeiIgk8SGdDy3e1P
         NS4Zpxm2vGjXpvkBvZH3vobF2V5CsXMQAfsJnh3lweNtCUL1KJOCIScMutbf+zyz1OJf
         RrMEWcLe6KGrl91gHyjPliC4XG5Kj7VpADOAdhpmB0SyJiNs2kWRdPpUN1dItVmnkStl
         nhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000242; x=1720605042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/FFHHxRXCiHESWSSzIR+30DbRf3GOBGMceZW/6eQho=;
        b=uEVaKpqjamBvsAov5wUy47txkjXlw4UKnj0oI7C5D0o+xQd0/XUrOrHTTza9ndyDZU
         1+8dEOPAU8nJR7VpLPdeWry+P6WR4GLGcID1s/d1CkAlOxM5iTyKTs2wx62yMRZesHVM
         e0oqd20cstUFThJgSAGf6i1/1LEhYtDa0tTBW4SET/6hOyR5RDZ48F/hZX4wUuNXwMhM
         Sn51K0dX8AMJ7+JeS8bs/IWyHY+T76KMf4Q2TGim1CceAIFx7y8ECpPbkP4ajs+niYnQ
         KH2RrciAEHT5zE5Dd0DkcyeID3cvwlBIS3yCWD+/Qah8DWA5t/RBYXRkMn3vz5nSz9qT
         Vieg==
X-Forwarded-Encrypted: i=1; AJvYcCXIIiQQVIc3I8TWpAwg16MaA17Zhp5iCdG4VfpdbcoIAfG6stZJAYngfucTerCQSuj/fROnzjy+Z5J+HtWadjyXMf9pilezFoOzlVGp0oetu3CqQOg=
X-Gm-Message-State: AOJu0YwvI2/Kxe4BF4Ik9D73do2a/Yc92oYSKmJV1phwpZm+6BPzu2/G
	zhFDkiciqhCP5R8WExCXbnqXqddsVKIBBjAI8w1hTgIuf11ZRfLS
X-Google-Smtp-Source: AGHT+IFvEQQ1or7Te92RZ7ee6rZM9e+5Mnmbmp6JAtgn1kSIV+we403CXkNT3daH3fdDLTkrC72WiA==
X-Received: by 2002:a17:906:f847:b0:a75:1096:bbb4 with SMTP id a640c23a62f3a-a75144b9bb8mr700286266b.69.1720000241798;
        Wed, 03 Jul 2024 02:50:41 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:40 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:23 +0200
Subject: [PATCH 10/10] clk: xilinx: Constify struct regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-10-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=760;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=0Ld8vX9WBeucJVIFv2KTKTHdTYHtYqJmnFDn01dCNek=;
 b=qbAZlsyWzomXPwtnqnjjR10PqlzCLG5uVxcNmtMDRmfWhY+nLBfhZqS5clqsqtfVrERC45aqH
 MoIjvu7D0tkCoOqeHOgE9Tak9NQ52dqqmYQ7r9zdNOTlkalNvb0TusC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025043_885385_1FA09778 
X-CRM114-Status: GOOD (  11.98  )
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

`vcu_settings_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 60a3ed7c7263..d983fab12756 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -68,7 +68,7 @@ struct xvcu_device {
 	struct clk_hw_onecell_data *clk_data;
 };
 
-static struct regmap_config vcu_settings_regmap_config = {
+static const struct regmap_config vcu_settings_regmap_config = {
 	.name = "regmap",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
