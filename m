Return-Path: <SRS0=HPE/=V3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953A1C0650F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:19:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 605E820665
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2019 09:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOHaenK7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ECewcIgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 605E820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iam57j0i30AxkbUsIxSLvtPA/cEQmpKUYY9LVlFmRwU=; b=BOHaenK73qKOp/
	yKtsyo15o7YGglwHlp4uNQdwbZ3oPQ293UqKBYeQ9qFQnyFirq+OiP9Rdzp+eDgOhVv0kqWfAheJW
	U5UJWeSJiXIOOXDBuCgP9ElcGGqapx6gQyZNDzNAuhFNaUPjYZv/apM2U8h1q0ftUlEd9edP6hKwv
	ehMPsr3w1dA0rteeYaLuESMcKL5yvMpJ88F/y43H3lPsVKOctCDJnGocIOzjxZYqwqXV9H+/vakuA
	hcyJvJby8O/Tt6D1y5a1dUsrGlKh01kP1qwxGFg2407bX8htELfg0n1SD4Gofq3W1bDeB6zok98jN
	B/ax5YUcQSTT/irDGk9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsOI1-0007tI-EH; Tue, 30 Jul 2019 09:19:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsOHe-0007dv-8O
 for linux-amlogic@lists.infradead.org; Tue, 30 Jul 2019 09:19:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id r1so64913393wrl.7
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2019 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ykkz+L7ueY/G9ZX+WPXhNymw6EgYaPgvung5Lo0cKso=;
 b=ECewcIggnR3uKWLBrdpedZQiWwaY+fYHBhtlK7l6/oIVzptrgfwKg6HldwrHVh+/vn
 73rKUSE04lYvy0hV42xjv3EwXzjvqqWINhF5YJElOdMoR1TnXAAIAJkiNgkLsC+CvwMU
 bRya1pzeZewlpas6AhlZ8h4H3ztEP+2STbrzHZ/QO6ULkPYWDYIDSfX04m3J5xcf1Rxc
 WL8YTLCnnaj0Rr5yHX7stYweYJXm1E2bicAUiZT3svNTlwFUJveg1fENdKfwmBDS8Tbo
 OgX3Ld47DtgygsXV3HUwLuIjelJbgRwAOu+nvtQ54t1C9k8sc2r8SN1jkS7SKhhJkxeb
 RSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ykkz+L7ueY/G9ZX+WPXhNymw6EgYaPgvung5Lo0cKso=;
 b=muDrkMlEb1u0mdo4HD9KqaWo3Rc2lFdwccVvyeObo3KkD/HJdUfPfDkw89XtMkfz7J
 yMVWqtd7R/CN005EDDwwedB1Np1z5Gub6Ao0jXaGYqJMnTJc/3FDNOfoys/o824YSxFD
 At9N5zBZQbAcs71GSgdYuOxx0AT5k7aW/J2VULy2NLAo57eevM9aHESmxz5m+eiIWrzf
 7GylqlIWQ1cdmuV5PGQCurAbdDS67xNQFE4GjXctZ30pGWA/Ye2svw+bQFgCi11VNdRZ
 puwTqGLzm5efsSSFqgJQ9mmR4k2znj3oBFI22KIxnlrq8Akk1kd5d4lCklRZzvQxLdjm
 uQ3w==
X-Gm-Message-State: APjAAAVgZFZylf9EFDf2mhvjG+usjcXM1N7hYQf6CkdivlXuNYngd4tJ
 +9sfQ1/Bq4h29NAmWah3ytxW+A==
X-Google-Smtp-Source: APXvYqxtRWJB7RfHZ3lpvpFOAlMD0r4a5FaFGRjyuOKz3gukwTvqqmEFkkQtJlIQ5tqT4X12i4jTSA==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr113690568wrm.55.1564478340251; 
 Tue, 30 Jul 2019 02:19:00 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id x129sm61681392wmg.44.2019.07.30.02.18.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 02:18:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, srinivas.kandagatla@linaro.org,
 khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] firmware: meson_sm: Rework driver as a proper
 platform driver
In-Reply-To: <20190729183941.18164-5-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
 <20190729183941.18164-5-ccaione@baylibre.com>
Date: Tue, 30 Jul 2019 11:18:58 +0200
Message-ID: <1jsgqn283h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_021902_438604_1E3E70A1 
X-CRM114-Status: GOOD (  25.73  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 29 Jul 2019 at 19:39, Carlo Caione <ccaione@baylibre.com> wrote:

> The secure monitor driver is currently a frankenstein driver which is
> registered as a platform driver but its functionality goes through a
> global struct accessed by the consumer drivers using exported helper
> functions.
>
> Try to tidy up the driver moving the firmware struct into the driver
> data and make the consumer drivers referencing the secure-monitor using
> a new property in the DT.
>
> Currently only the nvmem driver is using this API so we can fix it in
> the same commit.

Indeed, I don't have another idea to deal with it without breaking bisect

Thanks for this !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/firmware/meson/meson_sm.c       | 94 +++++++++++++++++--------
>  drivers/nvmem/meson-efuse.c             | 23 +++++-
>  include/linux/firmware/meson/meson_sm.h | 15 ++--
>  3 files changed, 93 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 772ca6726e7b..2e36a2aa274c 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -54,8 +54,6 @@ struct meson_sm_firmware {
>  	void __iomem *sm_shmem_out_base;
>  };
>  
> -static struct meson_sm_firmware fw;
> -
>  static u32 meson_sm_get_cmd(const struct meson_sm_chip *chip,
>  			    unsigned int cmd_index)
>  {
> @@ -90,6 +88,7 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
>  /**
>   * meson_sm_call - generic SMC32 call to the secure-monitor
>   *
> + * @fw:		Pointer to secure-monitor firmware
>   * @cmd_index:	Index of the SMC32 function ID
>   * @ret:	Returned value
>   * @arg0:	SMC32 Argument 0
> @@ -100,15 +99,15 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
>   *
>   * Return:	0 on success, a negative value on error
>   */
> -int meson_sm_call(unsigned int cmd_index, u32 *ret, u32 arg0,
> -		  u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> +int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
> +		  u32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>  {
>  	u32 cmd, lret;
>  
> -	if (!fw.chip)
> +	if (!fw->chip)
>  		return -ENOENT;
>  
> -	cmd = meson_sm_get_cmd(fw.chip, cmd_index);
> +	cmd = meson_sm_get_cmd(fw->chip, cmd_index);
>  	if (!cmd)
>  		return -EINVAL;
>  
> @@ -124,6 +123,7 @@ EXPORT_SYMBOL(meson_sm_call);
>  /**
>   * meson_sm_call_read - retrieve data from secure-monitor
>   *
> + * @fw:		Pointer to secure-monitor firmware
>   * @buffer:	Buffer to store the retrieved data
>   * @bsize:	Size of the buffer
>   * @cmd_index:	Index of the SMC32 function ID
> @@ -137,22 +137,23 @@ EXPORT_SYMBOL(meson_sm_call);
>   *		When 0 is returned there is no guarantee about the amount of
>   *		data read and bsize bytes are copied in buffer.
>   */
> -int meson_sm_call_read(void *buffer, unsigned int bsize, unsigned int cmd_index,
> -		       u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> +int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
> +		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
> +		       u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>  {
>  	u32 size;
>  	int ret;
>  
> -	if (!fw.chip)
> +	if (!fw->chip)
>  		return -ENOENT;
>  
> -	if (!fw.chip->cmd_shmem_out_base)
> +	if (!fw->chip->cmd_shmem_out_base)
>  		return -EINVAL;
>  
> -	if (bsize > fw.chip->shmem_size)
> +	if (bsize > fw->chip->shmem_size)
>  		return -EINVAL;
>  
> -	if (meson_sm_call(cmd_index, &size, arg0, arg1, arg2, arg3, arg4) < 0)
> +	if (meson_sm_call(fw, cmd_index, &size, arg0, arg1, arg2, arg3, arg4) < 0)
>  		return -EINVAL;
>  
>  	if (size > bsize)
> @@ -164,7 +165,7 @@ int meson_sm_call_read(void *buffer, unsigned int bsize, unsigned int cmd_index,
>  		size = bsize;
>  
>  	if (buffer)
> -		memcpy(buffer, fw.sm_shmem_out_base, size);
> +		memcpy(buffer, fw->sm_shmem_out_base, size);
>  
>  	return ret;
>  }
> @@ -173,6 +174,7 @@ EXPORT_SYMBOL(meson_sm_call_read);
>  /**
>   * meson_sm_call_write - send data to secure-monitor
>   *
> + * @fw:		Pointer to secure-monitor firmware
>   * @buffer:	Buffer containing data to send
>   * @size:	Size of the data to send
>   * @cmd_index:	Index of the SMC32 function ID
> @@ -184,23 +186,24 @@ EXPORT_SYMBOL(meson_sm_call_read);
>   *
>   * Return:	size of sent data on success, a negative value on error
>   */
> -int meson_sm_call_write(void *buffer, unsigned int size, unsigned int cmd_index,
> -			u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> +int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
> +			unsigned int size, unsigned int cmd_index, u32 arg0,
> +			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>  {
>  	u32 written;
>  
> -	if (!fw.chip)
> +	if (!fw->chip)
>  		return -ENOENT;
>  
> -	if (size > fw.chip->shmem_size)
> +	if (size > fw->chip->shmem_size)
>  		return -EINVAL;
>  
> -	if (!fw.chip->cmd_shmem_in_base)
> +	if (!fw->chip->cmd_shmem_in_base)
>  		return -EINVAL;
>  
> -	memcpy(fw.sm_shmem_in_base, buffer, size);
> +	memcpy(fw->sm_shmem_in_base, buffer, size);
>  
> -	if (meson_sm_call(cmd_index, &written, arg0, arg1, arg2, arg3, arg4) < 0)
> +	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) < 0)
>  		return -EINVAL;
>  
>  	if (!written)
> @@ -210,6 +213,24 @@ int meson_sm_call_write(void *buffer, unsigned int size, unsigned int cmd_index,
>  }
>  EXPORT_SYMBOL(meson_sm_call_write);
>  
> +/**
> + * meson_sm_get - get pointer to meson_sm_firmware structure.
> + *
> + * @sm_node:		Pointer to the secure-monitor Device Tree node.
> + *
> + * Return:		NULL is the secure-monitor device is not ready.
> + */
> +struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(sm_node);
> +
> +	if (!pdev)
> +		return NULL;
> +
> +	return platform_get_drvdata(pdev);
> +}
> +EXPORT_SYMBOL_GPL(meson_sm_get);
> +
>  #define SM_CHIP_ID_LENGTH	119
>  #define SM_CHIP_ID_OFFSET	4
>  #define SM_CHIP_ID_SIZE		12
> @@ -217,14 +238,18 @@ EXPORT_SYMBOL(meson_sm_call_write);
>  static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct meson_sm_firmware *fw;
>  	uint8_t *id_buf;
>  	int ret;
>  
> +	fw = platform_get_drvdata(pdev);
> +
>  	id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
>  	if (!id_buf)
>  		return -ENOMEM;
>  
> -	ret = meson_sm_call_read(id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
> +	ret = meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
>  				 0, 0, 0, 0, 0);
>  	if (ret < 0) {
>  		kfree(id_buf);
> @@ -268,25 +293,34 @@ static const struct of_device_id meson_sm_ids[] = {
>  
>  static int __init meson_sm_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	const struct meson_sm_chip *chip;
> +	struct meson_sm_firmware *fw;
> +
> +	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return -ENOMEM;
>  
> -	chip = of_match_device(meson_sm_ids, &pdev->dev)->data;
> +	chip = of_match_device(meson_sm_ids, dev)->data;
>  
>  	if (chip->cmd_shmem_in_base) {
> -		fw.sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,
> -							 chip->shmem_size);
> -		if (WARN_ON(!fw.sm_shmem_in_base))
> +		fw->sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,
> +							  chip->shmem_size);
> +		if (WARN_ON(!fw->sm_shmem_in_base))
>  			goto out;
>  	}
>  
>  	if (chip->cmd_shmem_out_base) {
> -		fw.sm_shmem_out_base = meson_sm_map_shmem(chip->cmd_shmem_out_base,
> -							  chip->shmem_size);
> -		if (WARN_ON(!fw.sm_shmem_out_base))
> +		fw->sm_shmem_out_base = meson_sm_map_shmem(chip->cmd_shmem_out_base,
> +							   chip->shmem_size);
> +		if (WARN_ON(!fw->sm_shmem_out_base))
>  			goto out_in_base;
>  	}
>  
> -	fw.chip = chip;
> +	fw->chip = chip;
> +
> +	platform_set_drvdata(pdev, fw);
> +
>  	pr_info("secure-monitor enabled\n");
>  
>  	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
> @@ -295,7 +329,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
>  	return 0;
>  
>  out_in_base:
> -	iounmap(fw.sm_shmem_in_base);
> +	iounmap(fw->sm_shmem_in_base);
>  out:
>  	return -EINVAL;
>  }
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index 9924b98db772..669d20d73877 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -17,20 +17,25 @@
>  struct meson_efuse {
>  	struct nvmem_device *nvmem;
>  	struct nvmem_config config;
> +	struct meson_sm_firmware *fw;
>  	struct clk *clk;
>  };
>  
>  static int meson_efuse_read(void *context, unsigned int offset,
>  			    void *val, size_t bytes)
>  {
> -	return meson_sm_call_read((u8 *)val, bytes, SM_EFUSE_READ, offset,
> +	struct meson_efuse *efuse = context;
> +
> +	return meson_sm_call_read(efuse->fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
>  				  bytes, 0, 0, 0);
>  }
>  
>  static int meson_efuse_write(void *context, unsigned int offset,
>  			     void *val, size_t bytes)
>  {
> -	return meson_sm_call_write((u8 *)val, bytes, SM_EFUSE_WRITE, offset,
> +	struct meson_efuse *efuse = context;
> +
> +	return meson_sm_call_write(efuse->fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
>  				   bytes, 0, 0, 0);
>  }
>  
> @@ -43,6 +48,7 @@ MODULE_DEVICE_TABLE(of, meson_efuse_match);
>  static int meson_efuse_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *sm_np;
>  	struct meson_efuse *efuse;
>  	unsigned int size;
>  	int ret;
> @@ -51,6 +57,17 @@ static int meson_efuse_probe(struct platform_device *pdev)
>  	if (!efuse)
>  		return -ENOMEM;
>  
> +	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> +	if (!sm_np) {
> +		dev_err(&pdev->dev, "no secure-monitor node\n");
> +		return -ENODEV;
> +	}
> +
> +	efuse->fw = meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (!efuse->fw)
> +		return -EPROBE_DEFER;
> +
>  	efuse->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(efuse->clk)) {
>  		ret = PTR_ERR(efuse->clk);
> @@ -73,7 +90,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (meson_sm_call(SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
> +	if (meson_sm_call(efuse->fw, SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
>  		dev_err(dev, "failed to get max user");
>  		return -EINVAL;
>  	}
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 7613bf7c9442..6669e2a1d5fd 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -16,11 +16,14 @@ enum {
>  
>  struct meson_sm_firmware;
>  
> -int meson_sm_call(unsigned int cmd_index, u32 *ret, u32 arg0, u32 arg1,
> -		  u32 arg2, u32 arg3, u32 arg4);
> -int meson_sm_call_write(void *buffer, unsigned int b_size, unsigned int cmd_index,
> -			u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> -int meson_sm_call_read(void *buffer, unsigned int bsize, unsigned int cmd_index,
> -		       u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
> +		  u32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
> +			unsigned int b_size, unsigned int cmd_index, u32 arg0,
> +			u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
> +		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
> +		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
>  
>  #endif /* _MESON_SM_FW_H_ */
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
