Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0905DC77B70
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Apr 2023 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rIKUC4qohi4q5Bhd5Z4DUCYESduAV3VaRBnin9wxlhQ=; b=ins/pvHdWG5IB1
	FZkVREYCvmFPyPVfu68vpEW4yJ1n+fOk+RLqRLL+tb3JMcDfwQ9DqPzuJkuxaULJ9Ouh2svJbw6yA
	Y/GYLjoCek28nm2MmNlilf8iWS0If6GpfvhSNHLRudJmcdSeXeGOMPKGp5NRnkDY7DqDX8YL3oERx
	jKpF/i8UGEdT+VcCbtUA55i0UP8VxJCTBC1NMCnfvUBbeu3cetH37A2ayHdyPMN15SxEYpcceHMOt
	D7Mv049yEKNPwr/tTZSpMrstvXnpBwnjpDIBJDJci0/LZQ1W2VJcy7piJa5pdxwREiagsNELpcKzd
	z4HMVKjLuO6RxEp8J/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plWlw-00DtdV-1z;
	Sun, 09 Apr 2023 15:16:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plWlq-00Dtcj-2x;
	Sun, 09 Apr 2023 15:16:00 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5049a1085c8so342141a12.1;
        Sun, 09 Apr 2023 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681053356; x=1683645356;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Al1LHFrT9+plpcBLVRezELznyWJyVoaJnaezPUgcF4=;
        b=WZTnRVtyyCX3XAI/9IXuHB3b6RrNv/SsBkmFPmc68C/MltXlia1eje7s30qBBY9oHF
         su40ISV+YoCe66oWNBpN+v4LMYFz9lcMinZaofFaHmazM4RRgLFicNGjlhTMeD8XmST2
         cGQY65wOGOzpcs2qQSQ1aTpqWWQCP6xDODafMAx8DDWSkDQ7NydbfyIhhlrU+V9zzLHp
         5j/FdwFCeE2AZR1i9LzmTMTgZkTSORCw5spZxcizhxfQIboiqxCU4r0M7erSwL/hRfZQ
         v5ddtTUKO63fhTB3cI1SuqIl/Hvj5KicbnOS5WLNjh8KQcpyJsdtllAXFpDuwJayGx6G
         qRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681053356; x=1683645356;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Al1LHFrT9+plpcBLVRezELznyWJyVoaJnaezPUgcF4=;
        b=BfdsV6kyVcGzi9uAnVeE62UFXIfNNoZiLwXGQ8HkjAfmqQ/wgbHorbBzmwizJfyRbQ
         pRC0zvje6naFhwz44rnTrcefnMT9mfrTfrIdnYDglqinGkilIhTvcK4VAvYCn9rMqsLb
         568boHYUJxengI09BMC+Xn0TnFFCvyfBwqekuh3nPf1zAujUjaZxZxZIwMsXxGil6BJf
         Vv4nqZ+Rx2Q0jqTj0DufGx+n+tdJrO5PU96EiqYWaRFbtd5Ni452AGhvpls5LircdLWc
         dU+zau4Hvi4ni5NVwfCNnCdP9rB/eqrUpmg04BR/roD2GSitRGgpQJWc4jaU7TFCbV6V
         dVgg==
X-Gm-Message-State: AAQBX9f++pbqLU0NiLwyuCIUBgvSYtsGrkyR7kklKBlsscW96heWiXHv
	v9+LVnYBr0oPsXiOnylsZ0k=
X-Google-Smtp-Source: AKy350b4nVjPPZSIcozRDhxLFOvnIY8jbn9Nshb1z6he5aS2hFU/rxY9WWwskx+5UiANKmuW/wsEcA==
X-Received: by 2002:a05:6402:746:b0:4fd:2b13:b20e with SMTP id p6-20020a056402074600b004fd2b13b20emr3592714edy.30.1681053356184;
        Sun, 09 Apr 2023 08:15:56 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7ab2:4700:19e6:ecdf:3dcc:c731? (dynamic-2a01-0c22-7ab2-4700-19e6-ecdf-3dcc-c731.c22.pool.telefonica.de. [2a01:c22:7ab2:4700:19e6:ecdf:3dcc:c731])
        by smtp.googlemail.com with ESMTPSA id i13-20020a50c3cd000000b004fa012332ecsm2583301edf.1.2023.04.09.08.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 08:15:54 -0700 (PDT)
Message-ID: <ffc3e4e7-b2ea-1a56-4fff-6554ad3775c0@gmail.com>
Date: Sun, 9 Apr 2023 17:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] pwm: meson: fix axg ao mux parents
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_081558_961731_87D9D809 
X-CRM114-Status: GOOD (  10.46  )
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

This fix is basically the same as 9bce02ef0dfa ("pwm: meson: Fix the
G12A AO clock parents order"). Vendor driver referenced there has
xtal as first parent also for axg ao. In addition fix the name
of the aoclk81 clock. Apparently name aoclk81 as used by the vendor
driver was changed when mainlining the axg clock driver.

Fixes: bccaa3f917c9 ("pwm: meson: Add clock source configuration for Meson-AXG")
Cc: stable@vger.kernel.org

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/pwm/pwm-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index b5c746fab..0fe0400c2 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -381,7 +381,7 @@ static const struct meson_pwm_data pwm_axg_ee_data = {
 };
 
 static const char * const pwm_axg_ao_parent_names[] = {
-	"aoclk81", "xtal", "fclk_div4", "fclk_div5"
+	"xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5"
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
