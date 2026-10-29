Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD4A606A31F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmMdiJH0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aEvFCMta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=foMOdSpEI3W/a3od2ifCtZ/uOR21HMj25NCCiSPCsV0=; b=EmMdiJH0tSb9YHgI+GrHHZgz1W
	W7tJ+Hs92QlnZrcGQAdK6fT359bvJuOQ4opf2Q7Bzk7PeaZ7puMrhgkfTDWVPoqMgaaJ8/Z7rR8GL
	1BAX7t82Zt0hrEvNOND+2k9rUrTwW/RjgaYExqsIK9/h0VANyHwBXnH6LMxGDCSwybzzQfJxueyWQ
	McuX6VmxMJ9h77uHWtLt8Bqoz2UtN2mVxA2sw0XPCFZL6GNhUWl3oR7/BVDH14FS6IjdaA3d+huQI
	S02hgiYmgkmQA4uZzkQzA+L2MsN7uo1bytj9HZChUeHNcuYTN4bO0SSVzOi3foPbnziJBpHNpxP5b
	gvnRrJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0t-0000000A7vJ-00mw;
	Thu, 29 Oct 2026 18:38:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0g-0000000A7ku-0fVJ
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18803505e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299075; x=1793903875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=aEvFCMta5PqB5jwrhEMGouoZ/HUHH1WYGa9zBgKo0Sy+aY9BoNG/8dlSm4VZG3IxHE
         mrfCEehBEh//yQEACaZhluNIOg2ZcW2hqpE7svtqauNzX/vPK9UHouev4Aaca4c0k4ml
         lJZqwxyN9jow/XasjWGm56WGDw9hdGcRxRXCLCg2fmNl1tu6Vt7kUTUFZhyzGBOrWTgv
         yZtZMoAj1ICRq2CfEm+lzaC8rG9uggpCNlspmSFK3ir4pe5+E1OOqpZdc0umES13f819
         F0tVaoMp44onmYL0aeOLioFZwC/F+VJlLdSI12TKiLLeKV6wvN34E8ovk5yg/r0iSXfu
         MZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299075; x=1793903875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCSLRnb0vtBw+c3BivhCF1ac7dx2yv+/JlPhFH01Ir0=;
        b=dAb8LTzYywESkdoRpENAmTCqt8733oxnf0uz7Sp+mtTCfHo1yb2asHfNrN5nrRcoqt
         3YdUtM7D8OBuideQ47mdWjTImOM7RIUIOON9JoTQnCgmct4j3D+OaMQiY7JkuH1lWBwv
         ZiYx/AQbZmpjjTJNGG8U7wsaxFxkVOWQVNp4SC7eOX2dtaxRwmrfdUOIuc8fGEZWzq40
         +hFNJWGAQ6jA5uO3CdP5rLRypEdxu64rH3m2L6awESbwoHT70QyVtIBau+CrDECrORmg
         jm+60HXKDwRKsL8tRUo5bQeZp5M2OoALBY+pY4mqntsaZ3FFMMrvC0hNSp64TbDb2MmP
         dBaw==
X-Gm-Message-State: AFq9FYIysDQX4X5RlkP7IbLS96ClTEBzUu3LtG2bPdpA7muG0jAf1/G9
	Yd7MdA7Lv9ceyQTFnUeE2xWhyJ3AjzCQHJ1eBA8ALB01PQkBO6kGxHrXr9F4BeCuDY8=
X-Gm-Gg: AYBFou1ySYwqgnnfKFTQ7xvigMmuOsUDP8Xf3KtWH2vF1IDgsmrTsTnYJYkVEi26KQd
	FSMQiB+i5aTJc78kfTEK9DF736Q9ct8iA7iKgk3xv9/2ziEKPCoLLAAGhm+BoKeyaWmrdFaNgPi
	2CShM3MRrcFVVQ2pMJvjizzbn0KBbv3ikAh5HLDebtCvGeGbf22MGTw4x0uvJGAnpL/c5EMNHvQ
	Fh77UNRH07jrTeNLDa8phyPcYvrVOuLbA7BEgN+IkXqLX32Sc2HqqniBIvWBBHAADoA7UL5quBW
	uN1SHH+9UdwttOudh/FJwMzUxPzSHc4FMI/QbIy4wo3cB5Wp+D/GNGOL4/MZABaQuU8K7duPhTi
	GIYTnLNon2ZzdeOt/hNktNEf5RnhKbf01glRKLisc+30tEL0KlcHiVjzbXkJzpeAPx82TwJjuZX
	hlFuOFPP9aUSNZf1iA9mJMwuWsuGGdTRrBSOVGgt0AzEYen3MPnvbU/J99v2SirG1CimksVId/P
	OKkB73ILijbYPeVh6PyslXaelst19r7vAas7dZHVCUNgRVviIXuBWwLqIm+vhPzZOS1ocE8yW+F
	OidJh+TZjNf7DY3ACAWGlP0FnbntHf72NzN2IA+JucbU3iv/C5f/q/t2ByAhVz5PjX+BH9X8/m9
	KLQt5MR7D1LXGb+sjZLs=
X-Received: by 2002:a05:600c:c8f:b0:4a6:42cc:bf6c with SMTP id 5b1f17b1804b1-4a9661ab555mr157927155e9.7.1793299074975;
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:36 +0100
Subject: [PATCH v2 3/3] clk: meson: s4: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-3-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113758_243591_9CFF6194 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ENCP clock uses the wrong selector bits. Change them from [23:20]
to [27:24].

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
