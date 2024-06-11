Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8DFC27C77
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRVNtX5doZHt30XRjYRni5qHDga1TB6fSv9+JbUbl2g=; b=I5STW+j6uuXCLB
	U31CjdveONGPXneSNXKOl1WZKLgjjMtnmPfW7OyM/MWCUKgeLwxnK82cOBvHRanb7LcyYc9vov/wv
	nuM5+lF/bfrzjtncf6FCaFiWzcIRPTZQR3MGgdO/pfa4w6Vllu1lBUo1Rb4z+UvH/7L/WlNZBCVwI
	RZ6nqN4Rce12gFGvJayiKT75AgbVCAXWzSCWUr8gphOk66oL3yvYH3z6LYrxLsRFJSOtidly5/o/A
	9CioohBY+OYTJf8oxi/wqLzD+tzh2S52O0XUnNXoGPdLgp/okNTn+gR2x1ZGLUCHgIQ+NBUbcQ5gu
	f3KprfYBUDHQnd4VAe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3Qr-00000009KWX-0AgN;
	Tue, 11 Jun 2024 15:29:09 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3Qm-00000009KRd-3u4j
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 15:29:06 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52bbdc237f0so1618746e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718119736; x=1718724536; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vX66emLSPsiCozjYEcIgCjpS44vD4TxBAyFyr2wQO6Q=;
        b=egXaq/nag3DCf9VQempCGXVYJ8i+L5pJpKezm2g6vGlBaXtCHTXEZrZfF6/wtqEDVr
         h8StRbRneR44fiWkwszEnd77AdR59+TPbnsO1YI9DDSn0IpIGwU/DmXnkvNMydQVGYjk
         zu1WyT6sll2MpU8sGh4OVmGlAUT5j9kh6raXVlA4oU0xxnLFVUzuKTK8//+3CXll2/Gp
         kwFtNaEwQe2Kcl1R/1+4XbuLp7oGSOoIy+9kW9AzNT/FJCezndQLwLqbIT/BvoN5mXba
         PnQDQX6zOm2hmLzT6BV+57SmSNzjl7w1zWDrR5qTfY8PGCIxc54uSbyFMIeJlWqsO7BW
         B5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119736; x=1718724536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX66emLSPsiCozjYEcIgCjpS44vD4TxBAyFyr2wQO6Q=;
        b=juNlgxTPL56k8Mb8Wf4Syys234hcqX+QVWhfawMyyu29ZH1Yr3ZMH+wqV1fwUOlifb
         aDYDAegNQEo11lJJtpLIK9VMpL93g+L5lWW0ceHb+npng9sfvzYPd9LRavPdGzEIftrk
         J64T0hlIReekvWKfoDIeqzhlD13eX2jLvgphwGwsCWni7MfPP2/2yNgjIo3aQdx+TL+3
         JgIIIv0W8KIVM5xTd2zdnbfqamb2VMnSkZRi+rd2zkSnCVb/Bqn6C6pe/UcZpTsFaoB+
         u/htwMJHB3oVg8Qido4ukuFC/2S585UrEiUv11wBT0cMeEp4Lx/e8tRfbX3UKzyx6XJY
         TwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTQ/VeYRbX72/ABH6qRMWXkl/WgL8Wcw9KNXMsNZWlt20bpyGfalzRD1x9KV7ZXtwwWycdJF04rHEZNOA9fQE9ydiGxYBZryz6xj8uSj6D21k=
X-Gm-Message-State: AOJu0YwKm8upvF9AZr0TAPXHRTTVP9w7XMl5Em42iiv9MGvc6Ch7KgkG
	ZmzSt0eoM2yIOUe4CxxOVzaEWREpMTIAvWWNdHccR7JrGKwaKciQ42hKQZClQMI=
X-Google-Smtp-Source: AGHT+IGvxWpypN+Q4GZLa8CZIb81/7RUuQZpYfehnYfxA1SgUhq7yrpOBlMV7ZeMcH30jRNwKRSigw==
X-Received: by 2002:ac2:4644:0:b0:52b:c10f:995d with SMTP id 2adb3069b0e04-52bc10f9afemr8727418e87.67.1718119735587;
        Tue, 11 Jun 2024 08:28:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c7e8fsm182702335e9.38.2024.06.11.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:28:55 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:28:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] nvmem: meson-efuse: Fix return value of nvmem callbacks
Message-ID: <b730de08-6d92-4667-810a-613d5f2855b8@moroto.mountain>
References: <20240611145524.1022656-1-joychakr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611145524.1022656-1-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_082905_091630_6B5DACF3 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, Jun 11, 2024 at 02:55:24PM +0000, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> meson_efuse_read() and meson_efuse_write() call into
> meson_sm_call_read() and meson_sm_call_write() respectively which return
> the number of bytes read or written on success as per their api
> description.
> 
> Fix to return error if meson_sm_call_read()/meson_sm_call_write()
> returns an error else return 0.
> 
> Fixes: a29a63bdaf6f ("nvmem: meson-efuse: simplify read callback")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
