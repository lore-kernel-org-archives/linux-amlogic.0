Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C97C74A5B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Mar 2023 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3Z0R86U3i1eL0ZAXY7+NKOsGVACCaPVZUrZs+qNcUY=; b=Jd8miMwCz/p427
	qtALHMR18RJr+lrPfiz4GoYhCrT2CVNHfospsqWoKhFbHCHmXeZTrw7kKTztQxqz2c0EtT1/xqyU5
	HNDk9N3DCuv+BwNxxcxzq0RBWl9pPRMD+vMusWbXP6a6bNugKuIWZnt09/DkZX5Le6YSc0deu53LD
	u2dkVu4zI0HQlKTC5r3/9tEe8BEkVROL1weRUWP7mJZqNqbiktc3e2mpJdsSubouKpTUS01f7DyMR
	n/3919U0NC8MVzTndJDhdnN2BW4WHyNXarp45N/sTzxMebQ14DjQzXGBJpY23Cm5aOscA2cDTacey
	mQOdU6oI7zO/XLgb69aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9Ku-002DzA-0u;
	Fri, 17 Mar 2023 12:37:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9Kr-002Dvk-03;
	Fri, 17 Mar 2023 12:37:30 +0000
Received: by mail-ed1-x52f.google.com with SMTP id h8so19758885ede.8;
        Fri, 17 Mar 2023 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056645;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZayqswrbZ5QKKAD9r+P5nbMwyqOYAxRHhSqir5Y47A=;
        b=HBPD3CnSAB/ZPFiN2l3lS+vD3GXGwIyXa+NJzUy4XLbOBqPoXnalzl0SdCHcM68oSB
         ugFPC8w4TXBJVN6oBPVA/OHnF1qttx7eZ/2qV0QujCA5bRKqu/Kf7R7ffb39VgKoUSvD
         vdSntNH+0/E3Yc5TI7++fGS67+j0Hbed0njnveIcwu1rOa+d/ExOcPxl5JupULGwojVW
         vUZTUQgyQlnJZv2w/GHX9XnbBSuVPHP/sRB95mDlVWdYyjxuBHpt1L3p8TK4FkbL4737
         wKID/TYOYMlYdY2A8ChY6TZGuWx1LW/38VcV8BzKz3mtpppAM0MeheCJS0RjfR/41eup
         lXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056645;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZayqswrbZ5QKKAD9r+P5nbMwyqOYAxRHhSqir5Y47A=;
        b=ZtGZgbfmT4aH0jTTYe/VKW07/p09ot8rS3azZyQzxplW4UbiQaDdGJvXB6xWRT7tJG
         pH1bMGz+7OW8jZ5p6wU/g7LKgcbia0Rrd93hVPt2Pa6vT6c4RrDUtrRFnNjhYZCyEMPA
         4TlTeOUlgRxK/F8IU48Z+k8fwGxOKmpJ1rQdj+uKyWja1yUpA8xMcq5Ayl3vnnnDzk/i
         CUUD30W2wdKEw0xyN6YEYFXH2ACve8Xhmcimtaf0NiWFxsVOdG2FynL27XACzYL+9cUt
         rBBZA374a/z6Xyp8pcDhnyHZOHljKZ2HXIGPZlvn5TiUdBBboqfIX3lgRj7Wr35JuPV6
         9EbQ==
X-Gm-Message-State: AO0yUKWZ6ZdmO13T8qbCZcfHFTf+1zzln45ZGgjx7krAxaz04gTQrixu
	y6Eo5NmorMqJNpED7Lh6Q7Y=
X-Google-Smtp-Source: AK7set8SIzE61mtegRU9aGVKdIM5UDvWT/gsPpdG4j/g67fGeWgRuOnADBuRN1Z6LNGXdCN1ZlHcYg==
X-Received: by 2002:a17:906:3f87:b0:922:446b:105a with SMTP id b7-20020a1709063f8700b00922446b105amr2847350ejj.19.1679056645209;
        Fri, 17 Mar 2023 05:37:25 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c5b8:6200:dd0b:20c2:4c96:a825? (dynamic-2a01-0c23-c5b8-6200-dd0b-20c2-4c96-a825.c23.pool.telefonica.de. [2a01:c23:c5b8:6200:dd0b:20c2:4c96:a825])
        by smtp.googlemail.com with ESMTPSA id cd11-20020a170906b34b00b0093009bc5825sm945928ejb.2.2023.03.17.05.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:37:24 -0700 (PDT)
Message-ID: <ac3b4356-d4c3-25e4-9bc2-c5b369c676b2@gmail.com>
Date: Fri, 17 Mar 2023 13:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 2/2] soc: amlogic: meson-gx-socinfo: use new
 soc_device_register functionality to populate machine name
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <d846047f-b714-3fd1-d8c6-9f774902fb9f@gmail.com>
In-Reply-To: <d846047f-b714-3fd1-d8c6-9f774902fb9f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_053729_061326_76849E9D 
X-CRM114-Status: UNSURE (   9.50  )
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

A new fallback mechanism has been added to soc_device_register that
populates machine with the DT model information if machine isn't set yet.
This allows to remove this code here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 165f75484..6abb73034 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -174,11 +174,6 @@ static int __init meson_gx_socinfo_init(void)
 		return -ENODEV;
 
 	soc_dev_attr->family = "Amlogic Meson";
-
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
-
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
 					   socinfo_to_major(socinfo),
 					   socinfo_to_minor(socinfo),
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
