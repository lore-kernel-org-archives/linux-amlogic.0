Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7FCC25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P5YccuvovXTu4BqFwYXCi0AWgJGJoZiik4AXgEfgd5g=; b=1CS1XGHkzL6F12FP/fCAte//eI
	oCHABp/XyTz5KXyE87zaPnhn4vVDtxyh1lp0euLFdTit9RIk4G0F4/I5tvYPs0vAEkC/HTVZhXfET
	kkEh//1u0qHimjPgKSYnd3VqOI4b1LMroYP/nEfuGk8BDqSnk64OdoeHtj8pLULgJ8d10AdYau3Hy
	4ucZqMLc5VpVzy1SfyKwLJ0ctTimbltP5+iR7RRyG4HBvFYLCkXV1YAedr0UUwF0GOVaWJ7cwzWDC
	bV+33K5AWXPlMMNdY3Y3j38o3M7HEh1UDA42Cr92QFE+rrIURxtc1BtTf9jCcv200xGzOsQjS0xhB
	MMoRgUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvts-00000007Frd-2Xz6;
	Wed, 05 Jun 2024 19:02:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuwM-000000073hn-0JsO
	for linux-amlogic@bombadil.infradead.org;
	Wed, 05 Jun 2024 18:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=; b=VLzluuJEeo/tB9p1CTA5zX8gOE
	b6lIriWFJ7enBMxl9VXvo+640l62U6sax8zaQmSBgQXshZU5SyWuLx31clryf+nwCEEb1VuyhJHlL
	tQ88MEtmafvh7DdZFpRClA16jvTUzkImtpaXbJ9Acj7dBgZsHSVKm7DIFUvlJ7MH7aWzfWr2Vvhcs
	0QHGNTDAQXe/ELwWWSgWTFGQsDKrkqzbFrmETvMThDU5GUWgYfwTuQXqcfHhtZ346uJ56SBedfH5u
	AF6qbF9i2/GIl9p7rBjQoV7igxD8iL/ARzJzhda74eFSmZASf6Bi0+lB2y1YcneJdTHD9fq0hT3XK
	ArPp3Nug==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuwF-0000000FoyG-1GeJ
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:00:46 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62a50486746so206437b3.3
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610439; x=1718215239; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=;
        b=bcCU/reJJJM+TC4H2ziQ8KexXzhsQCx7/TuSb/bHcaZnipid7WvoVrT+OuFsDdO82s
         7R8L/eOFV4kSlL5+yblrZ+kW4JAj9RDeK9/lhkTFEFSLXT62tlUfdG2S0gwx0OB1o0Qd
         rajIr2tl13gAgJ8f2lvq6GCwYaSe2kVIu2hG0WLR0Em/0CrtO7VIlGucFL2+fDHeF9RG
         lgQvsfJVdT1TVTRJQWYxehd43RIbbWT/TxM7MFijzb/LNqHkDgQvNBzwaGJ/9qqPHYkk
         O3jfb/yFpv+dZSXpuFkQfU9KMYrC8RUOdf7UDfiMQvW6CabBDxkt9o2d6SG3wwi0Yuee
         fAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610439; x=1718215239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5/Bg969zZ0eVFu5myprHh5fQqxMXbek8nDgGOBzWoA=;
        b=jQfjzBj53X2qa/Z8W28hIxb7gOPYhkaAOj3lUZVZsHAZAnBvbNbqxuMxnjMGDX8zMa
         BotHhmyv1EZWkciNHszn+EPDsUWdR16/f9ZiOefhVe7PrXfE7UXzFxBm30PKJV3LX9tN
         vvLIxq8FOW+ER0oi+Xldfowi/Hj46Cskfjdx8K+AgdaRuzf/JoDcxPvs7HptgIjxTLLf
         FofWh83RyyjJRtz4iy43fR6YbWdk9Cy3bzXKSesTFNVTJbDGwaxsYCmmPZN7WjB0U5mO
         NOnmZIhdUl61PipdD8FHPhu+wgBot1MJ/SL2pNcmBBTlwICEMNtsO17DVNDiwqsYaxmx
         6Klg==
X-Forwarded-Encrypted: i=1; AJvYcCUSTteqoYbD8FXAU+0cP1admKEK8ytRiP2/jXV3HoeH7Kpn2D3X+amlsKyCcoXvBO1VZ2s8rPP/lark9E+0wJoMyYGoL/4RUIQvHZ294VbbA5I=
X-Gm-Message-State: AOJu0YyeMQt4EJ/tnouoa/q1M0zfl9YLLq6MwZvf2Vagie5fy3X3MWqZ
	GZK3iz3+k6s1adzcE8vZhvqG7pFhbD3pPGdd/4u5D+a60CykU5B4lQhmGdu/0lMDYFkiztDVij0
	R81/uaMlnug==
X-Google-Smtp-Source: AGHT+IFfzGEzBdG0mJIzkY83NzFi7HVUzu/maRQ4zPj2TdB+TSZFtwNCtZCm0+GEQSlNaviP1mxKnEiXfVn+VQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:d90:b0:62c:efc:38b7 with SMTP id
 00721157ae682-62cbb4a22a0mr7561267b3.1.1717610438615; Wed, 05 Jun 2024
 11:00:38 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:53 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-10-joychakr@google.com>
Subject: [PATCH v1 09/17] misc: mchp_pci1xxxx: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_190043_457481_9D6B38F4 
X-CRM114-Status: UNSURE (   9.24  )
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

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
index 16695cb5e69c..817382c342d3 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
@@ -117,8 +117,8 @@ static bool is_eeprom_responsive(struct pci1xxxx_otp_eeprom_device *priv)
 	return true;
 }
 
-static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
-				void *buf_t, size_t count)
+static ssize_t pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
+				    void *buf_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -159,8 +159,8 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
 	return ret;
 }
 
-static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
-				 void *value_t, size_t count)
+static ssize_t pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
+				     void *value_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -214,8 +214,8 @@ static void otp_device_set_address(struct pci1xxxx_otp_eeprom_device *priv,
 	writew(hi, priv->reg_base + MMAP_OTP_OFFSET(OTP_ADDR_HIGH_OFFSET));
 }
 
-static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
-			     void *buf_t, size_t count)
+static ssize_t pci1xxxx_otp_read(void *priv_t, unsigned int off,
+				 void *buf_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
@@ -264,8 +264,8 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
 	return ret;
 }
 
-static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
-			      void *value_t, size_t count)
+static ssize_t pci1xxxx_otp_write(void *priv_t, unsigned int off,
+				  void *value_t, size_t count)
 {
 	struct pci1xxxx_otp_eeprom_device *priv = priv_t;
 	void __iomem *rb = priv->reg_base;
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
