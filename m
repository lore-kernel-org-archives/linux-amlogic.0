Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A6DC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb8B8HJNUMIDIg8IEqL7JhKjFsKyPh+Z3gV8S1k1Ayc=; b=YV9fZQ3zgcYzrs
	sfMvaXLPKqAJpHpOTGgn5B+DxXuZsd8wyqWDyildw/c2Ufwop2Tzeh1332Wi78GhgLtmYS7sMgyZt
	PExS3P/ekXEoRTYDc1tehGUSUzucf/0z0QegBezrQ83TpbE1rPUiCRbHMY27WTJ9sjUjyjSdbrHwN
	O9t3MHjHV8KygWytVNZpmWZbrK91IBjbPFHEKFM7HCO7VCRIIhDeCeRkZ6h9skc0GzpYus2QGS024
	/v1y0u6JObu5zdbyDpMiwwYZ8pOIcU7a88tyKo38OjRI4i2mbKgQ5qdDCkD3oeyMNETt95FzQjNmi
	Q2O+XyGEA0jfxo88rXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF7ls-00000008iML-2lOO;
	Thu, 06 Jun 2024 07:42:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF7lp-00000008iL1-3TDj
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 07:42:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57a2ed9af7dso865001a12.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717659760; x=1718264560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=QpdF8/e2+csDerZVEAgxFTXKe4QxjbJf/SuFhVnwju5bl8w49TY3TwHrWdUAQ8zY6y
         lqZ0GgewidQxXU58nkFYTdctAdti9jZeJHVhBd4WWJwoMmTUoANmnEDRYe/RgrQ7Lisl
         UTbUQayPecNGtxkpQjPYNvxMgmgFwjcJ168VSD4R8rcLMHR23xn3GvwAUV1uE+Ca/Hab
         DfCUyKvhQ+ZdX56fd2flfrqBqKEIRLR9gM+jESSi2MaSquuaL0rkHJy5h8fe2ZjPBoiL
         HWRD78GVnCtMZO8eYycVkI7sF5UVzrCZ/LRV9CUG5dLPYAP1AR/VWLYJBloB9Dncetye
         AhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659760; x=1718264560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hn7A2vtREo0E7HfSwjkC9hqptsOSWf7nUvmnuVDMQY=;
        b=JSRy8Re2Y+I00HXjal/1GDpzSyOmnyeYYFlHvhMXE0+ioeyIG1mGFfHKAjDdO6erx2
         nHk7risil+oXl5vOS15EcPxQ1v8W62c40w/2+QqxzxBYZkFbWYLieNi7pxVc0cjO/+rB
         i3jDGU2pViWwtirTlYkbKqVA6/b8mJUcFdcFFvO9i/0RLP1P6Mfmp+nOBUkbuuUjrFUN
         aWg50b+Pzu6aJMwz3sJvVNtvGsXxhr00uqTjNIFy+FqiqzW2/c6HRCVmX0wtn/sGE09z
         t0JxmEcuEBbun/lkKvUITWM8gZRE5jUUhPzGoJarVcyC8ih9VwcwuvOLR0SLHxKsTHSl
         8tGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Bhm7+4E4zevC8xXLg/LHfGP/gxmgezzVZU9CD/NfcFNFArZjib94twBl9lfzW3m5Is3RgxiyLAy5gvRw4MI/XxHJIJ4uK3DUOx2+Qw2ZjjY=
X-Gm-Message-State: AOJu0YzluMjcY+XHePJwTKz3THXzFjlphD7DzVepZgfzrNtwFbluWi7x
	IS4T3iFgTPksIUHa34Mc9CqTwx+ElxvsBcVAvCVH2U666G9ea6nSYpETcAczdpo=
X-Google-Smtp-Source: AGHT+IG9fb84ekx6f8HaBtotI1FnubBAZuTJ3dgM/XdsdCeyuhCLEIFdUbolQkfIb3FKjJXzmIhddQ==
X-Received: by 2002:a17:907:900e:b0:a68:fe79:9499 with SMTP id a640c23a62f3a-a699f88b67cmr343464966b.40.1717659760015;
        Thu, 06 Jun 2024 00:42:40 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806ebc43sm57149266b.141.2024.06.06.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:42:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem
 reg_read/write return type
Message-ID: <08ff07f4-034d-4342-89da-d83044871ab1@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-2-joychakr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605175953.2613260-2-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_004249_999826_B81FF140 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, Jun 05, 2024 at 05:59:45PM +0000, Joy Chakraborty wrote:
> Change nvmem read/write function definition return type to ssize_t.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>  drivers/hwmon/pmbus/adm1266.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 2c4d94cc8729..7eaab5a7b04c 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
>  	return 0;
>  }
>  
> -static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
> +static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
>  {
>  	struct adm1266_data *data = priv;
>  	int ret;
> @@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
>  
>  	memcpy(val, data->dev_mem + offset, bytes);
>  
> -	return 0;
> +	return bytes;
>  }

This breaks the build so it's not allowed.  The way to do it is to:
1) add a new pointer which takes a ssize_t
2) convert everything to the new pointer
3) Rename the new pointer to the old name

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
