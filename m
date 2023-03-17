Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAA4C76195
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Mar 2023 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwNO4AJuXdStodsU7rol4h0zF/t5Mw3P1+1/u3zh/rs=; b=ybSc1o6iLlto26
	S6W6LLkjCbITIhBARV8KZ9TiX0lIRmx6s7l97TKCrd9XbrGgcR03mCHU4aQcYG2oeKOoQCIH4ZQ3k
	dGp8fkYqUbFsIicDekh3xsQxXYSQV5mlKqfAivIjwwyXeAg80wqdzbTl5s7LNslN1oObHYtMTgt8j
	Npk6za55XYu3Y7GNBY8gX8TXpS2GF9/zG/4/1xOZJzFj/PPxAjWqKLbGguqKdURRnDLPFdbodZKpw
	OMASQf5LuzKP10W68abjhudl7AgMPhT1HaKh7NHN2qULDt04DpK8z8ceIF2/a38AzB2Z6i1SEuIyk
	VuCoha5NRdXFJvOaXvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9Ks-002DyR-26;
	Fri, 17 Mar 2023 12:37:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9Kp-002Dvg-2X;
	Fri, 17 Mar 2023 12:37:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y4so19852505edo.2;
        Fri, 17 Mar 2023 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056644;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zG+Fullr1evfHoIsSVfpr6zWgtZeQgscYvErLPyQFGI=;
        b=gCuBPF8Q//qtJHEANJYlS6l2sNTnvzGXgW7oTC/0ZEhziDZzOKxWNrWzMMHXTNNQaB
         qpJ9TBGAx1KZldJ9Q4XGAlKm+biixAVxoASEdMetmF56HW/DHGXq/jOBBagk28gQAxN+
         qS2vWBOSOU7l9hg6M4qMs4fnzxqeyh2F2NdOCj1WKHrEkB2x/ZZnsBfk3caUEv2ml7NE
         Vr/+HbOQu0F3csoE7FmF9Y3XLNU20UF5Go3vwh9AWmDti3T3NtrCEN3siUMxT/hHUagE
         IENK+8SDm8FcxSctWoKtHnFMteYpoeTrReYQccAxNIQqoS08kzKgfIgi8G7ePWYWr+v4
         odjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056644;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zG+Fullr1evfHoIsSVfpr6zWgtZeQgscYvErLPyQFGI=;
        b=Jk0z3O8+a2AVIIfQpcRDMbefNj9/STqfX6A3IEP8QwLnh3pSC55i17znJ/qTE1mwHQ
         1jVkABKKWmgHS9VvEYOZqHd8EutHLxTJ8TzRtM7CVxRkKoiUWRi4wmgfNII8Dxu6KYm6
         G1u0eo5VXZAv98twRBjmxy+SxzE5UWy1zyGfowu5dMrb1ImjmBIw1iYF+KnGgoE+2d4F
         3zSs5GjpZ5ZcWhAfWrt2MsoB/MsTeUBW17EUbJuBGu/5CVFRjEUp3nrqsULrT5pt5j/K
         WkNaoCaaTdvhzzw5o+Clmo1SDuUdes9JqDTl1wIfH54XrBYGWi3mM/pABqIv8yLHJOFk
         zfpQ==
X-Gm-Message-State: AO0yUKXuKYWjKY9rZrWGDKHeCSaSoi/xBelP0yy26t/BSbZ5khRyR5YZ
	5DCy9NqxQ7BJ3t2dia4n+Bk=
X-Google-Smtp-Source: AK7set8ayA3Ff2SyNGaRCXyUM/1nEx+2zZjs7st1mYfUKWCv6Bj0GP/yy9Fglwgknwlo75Gv3fY+jQ==
X-Received: by 2002:a17:906:1254:b0:8b1:fc58:a4ad with SMTP id u20-20020a170906125400b008b1fc58a4admr13864475eja.11.1679056643943;
        Fri, 17 Mar 2023 05:37:23 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c5b8:6200:dd0b:20c2:4c96:a825? (dynamic-2a01-0c23-c5b8-6200-dd0b-20c2-4c96-a825.c23.pool.telefonica.de. [2a01:c23:c5b8:6200:dd0b:20c2:4c96:a825])
        by smtp.googlemail.com with ESMTPSA id k6-20020a17090632c600b00924d38bbdc0sm938073ejk.105.2023.03.17.05.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:37:23 -0700 (PDT)
Message-ID: <6dbdf458-9f46-613e-de58-b4a56a6cdd9f@gmail.com>
Date: Fri, 17 Mar 2023 13:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 1/2] base: soc: populate machine name in soc_device_register
 if empty
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
X-CRM114-CacheID: sfid-20230317_053727_829229_41C6F700 
X-CRM114-Status: GOOD (  12.09  )
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

Several SoC drivers use the same of-based mechanism to populate the machine
name. Therefore move this to the core and try to populate the machine name
in soc_device_register if it's not set yet.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/soc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 0fb1d4ab9..8dec5228f 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -7,6 +7,7 @@
 
 #include <linux/sysfs.h>
 #include <linux/init.h>
+#include <linux/of.h>
 #include <linux/stat.h>
 #include <linux/slab.h>
 #include <linux/idr.h>
@@ -110,6 +111,18 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
+static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+{
+	struct device_node *np;
+
+	if (soc_dev_attr->machine)
+		return;
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &soc_dev_attr->machine);
+	of_node_put(np);
+}
+
 static struct soc_device_attribute *early_soc_dev_attr;
 
 struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
@@ -118,6 +131,8 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
+	soc_device_get_machine(soc_dev_attr);
+
 	if (!soc_bus_registered) {
 		if (early_soc_dev_attr)
 			return ERR_PTR(-EBUSY);
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
