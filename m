Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50643C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yHIYfEwp/11/z8Ef/03QhrTCQg90vkL4aAEmFbLk5Ww=; b=0SCxmUAlICENTXFlX2uCUm/Rv9
	yLGWF2h4+zo8mwK0nVcB9VzOtRE2zLZCtiuWqP29KaB4n8Yn1KZa3wV3q3CovzFA3wc2aJzHriVOo
	UnxFHdjxphvzisqlV0tjWzcIZUSc2nbARCNKrJ00aNm8vHlbnRubMQiypFFpT22drE9fr6HNN2390
	mLCz//alDWhg1vCaFKhSwatQ9ayde2r4vFaUj7k89LrT1pJWR3xzaPsYToFZYlh5JOqLCiM3XovRi
	cSP3YPtB4TVQ1fw+a1wQzDnCsbVmTKcE9i13eYdTSAF0om/U1/Rqw3l+hlhhPTq1n57LCpjPptJyz
	+Pg38aqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEw7x-00000007HnI-2uoj;
	Wed, 05 Jun 2024 19:16:53 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuyX-000000074ez-3035
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:03:09 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df7a6530373so136764276.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610581; x=1718215381; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwrLVVIieFUQPopwc+1tOr/or/db/Iy6oXeR6vbSkEA=;
        b=scMguZFm0aMMHS77WfvCXkcABWDTksqWeawQVarsK5Y7tACgww38kpHFcxINrnFldF
         NV0o1RAO6oQRNbpJjh6GjdjuTACgWWWFmFF2ADhuSrgzXgJK36MxIDoBZhLjr9GdORqC
         wJBANp58TGyw60qhdK/F4pQAU9SkN3kqZu1bz6Q3r5CXSDdV/4ndttZIHaNWSeUr2TCT
         gALZt1SWiQcqW17zaJUG9kicJRawSl9XIpgGVo9UQDZmvVNbpABkxM1qzkdiwo/a89Ac
         VD8MXc5iE5S+yOH+GUwnOE88WqWyl1M2BDryMVqcc+sicpo9qfhIhRvUQjPQhOgoTI7u
         2KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610581; x=1718215381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwrLVVIieFUQPopwc+1tOr/or/db/Iy6oXeR6vbSkEA=;
        b=mms6tiFirVkghJSz3C+7ShXl8T6IlaB7DfZGHBbRkgUkQZKVBM8TIq0r+d61tLX9We
         gYSXFt/ZkcZqTekf80neF9zVR5j6YfKsxnqBwy9Y/n8HN6fFi7Grpi9NHUeT7/MJRF9p
         EdQE+jVa21LD2S1hLnB9eEjKzfFIN/JW9GaWGF690+1AgkkkEeSr20dCPlr5aOXpZ12z
         sI19kwycWazsjK5Izz/Lv4UnjAPVr9KIPqxpTQU2XbNnrA8AfLBgCEPkYPxHU4Yjbg0a
         QnbqaOgNyeJUi3G0bYMOeAFIbJNSZYY0dZnEnNJHTXgwg7LSLYrtvzm5DyAZEZE9FEqx
         zSMg==
X-Forwarded-Encrypted: i=1; AJvYcCW682Ijr1EACkC3r3f/l+cYWb3/9ibRoaKNeSEyJ4u06T0USIGOkrnbN3SnlMpmZ6SEXR26FD55MU12uQrP6OPndWfmVEDZdPDTaMYVzvKS9Go=
X-Gm-Message-State: AOJu0YwDDfjpfe6D6m1SkhNWBOwv+LhAea+iOKOgKJmG8OxhLozBtmx8
	d2ipA58qhygLqjkFS+iOD2Hh7KUvOAJIjbY5oxOt4ztMoDmg50m1nWDQ8OY91VeTbjDIfC4xm2M
	xfpllN7hx3Q==
X-Google-Smtp-Source: AGHT+IE9F8AaFWy+zkoE1AAtvE0JQ7XHHDVuIM2gnYtU9d2txGGQvOGhBI3kC4/nhW85Sx5cKDFxLERd+BeUJQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:110c:b0:df7:9274:34e1 with SMTP
 id 3f1490d57ef6-dfadeb57766mr87616276.4.1717610581556; Wed, 05 Jun 2024
 11:03:01 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:35 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-5-joychakr@google.com>
Subject: [PATCH v1 14/17] thunderbolt: switch: Change nvmem reg_read/write
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
X-CRM114-CacheID: sfid-20240605_110306_017367_DC52D631 
X-CRM114-Status: UNSURE (   9.71  )
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
 drivers/thunderbolt/switch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 326433df5880..35424a65cd3a 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -301,7 +301,7 @@ int tb_switch_nvm_read(struct tb_switch *sw, unsigned int address, void *buf,
 	return dma_port_flash_read(sw->dma_port, address, buf, size);
 }
 
-static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -321,10 +321,10 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
-static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct tb_nvm *nvm = priv;
 	struct tb_switch *sw = tb_to_switch(nvm->dev);
@@ -342,7 +342,7 @@ static int nvm_write(void *priv, unsigned int offset, void *val, size_t bytes)
 	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
 	mutex_unlock(&sw->tb->lock);
 
-	return ret;
+	return ret < 0 ? ret : bytes;
 }
 
 static int tb_switch_nvm_add(struct tb_switch *sw)
-- 
2.45.1.467.gbab1589fc0-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
