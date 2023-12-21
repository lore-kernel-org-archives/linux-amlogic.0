Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980A4C46CCD
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wG/kkibsJe1V5IWgAhhMZtH3JJaofZ0QYAuWdCqbMmo=; b=uLDt+mMigrU7CO
	G8JwIqkYgYwPkmA4G2OdC6U5wg8ityJulNr/ejZ6gVmKBfoD/lF2H3qfy5uXKHSRIeo1n2Qj6Vko/
	0csag6ArIs0UxUCRz0ZSi5Vm05AEUDl3GkxppsvrLzvUQLPcx3cT2bWf5muAto/Bq+ufLTo6KzMPv
	OmrFHF4+JHZcANf/e204no5OR20IxUTsPJaWF+29/yO5qcqfH3fFphO9ryHzV00d5ioC/XKTjcAhx
	jFxA91/2BAV46Nw3a0ckm3IBxesifKhMcZFkbD+nmL6xeuF2plKBN/Sjq/a4SHrebgAHJcY6W+3/b
	U6QSxAx5hO10P9Ec9x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG1L-002O3C-35;
	Thu, 21 Dec 2023 10:11:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG1J-002Nxx-0O
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 10:11:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-336755f1688so526023f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Dec 2023 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703153469; x=1703758269; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:reply-to
         :content-language:subject:cc:to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dMObNTLbiCqgZOU19vHINWmmp+QWstCS1LGacoiIgn8=;
        b=ea3MyW6ZBJZBp3jROZcCKQ5xYmNSXfdLEnOqg3VLQ7zb9A5+momkVEsAOp6Wxni5UV
         UTqICoE9JEUkHWVIjDTO2FwgvRzw/bjtDj2BpttwqX7qt/rTvIBAos2zQuCkHbLFgM8M
         rk5zlyn82H9AWchcsL4NmE/ZzzjqLy5hmywneR4jpAZ3afpxKUxyLBxvAiPN2gNd+U80
         u5NeU+vSYcN+iN6wK6DJjETfjzKHQ1LZbx/nzamoumWu8taCzVKBPyKRT+YVQqDaMW/7
         LBbzO9WBT8M8SIoMOKQLG3P7jCQo99A2vYftV68Xj4cn7OEKq1JQ7IYzTafYOYJrJaiU
         sbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153469; x=1703758269;
        h=content-transfer-encoding:organization:autocrypt:reply-to
         :content-language:subject:cc:to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMObNTLbiCqgZOU19vHINWmmp+QWstCS1LGacoiIgn8=;
        b=lAN9AgbcqqQ0g71tXZuSZY0W/tXCAg/8RYIab9IpyWDKiVQ3ATS+q+jX8m7todEEA+
         P/+2eGXdoxxN8aGhAAOarj0GWwJvEZYz+S19hRrtwQNWxC4DiHLsM21VtP1d0JXORp2Z
         8HMpXBHpkolutRo8Mbf2AXQ8LRP6Dz84q+RzkBRw2DZncWj7z4gxf5I7NpsXgdwY0U/S
         5T4v/RPiIBQauXQePAdkePi8VY4xor50zQtQ11eLi1lQj4Tc9ruqbJhKCcPAElwf/NzQ
         avltHW690HUADZcJM56J8DkePBu29NeFnxqvv8vNAlEi7bdR5RazrpkocTITylXZ6EVv
         k8MA==
X-Gm-Message-State: AOJu0Yz3H4Xn/+juIITfr1cbgu4lQbdTdVdLUc9gwuemVr6DtUFaCq+p
	r6lSd7LdxqLI2SUrw5o97j9zcw==
X-Google-Smtp-Source: AGHT+IGMxxb+i7hFixEKwp+Jxq272QxhvTL0g3UKNL2dF9t+9fE7DPps2Q2XKWhpik6Y6iE0+E7cvA==
X-Received: by 2002:a5d:540a:0:b0:336:5ad7:2091 with SMTP id g10-20020a5d540a000000b003365ad72091mr513219wrv.143.1703153468819;
        Thu, 21 Dec 2023 02:11:08 -0800 (PST)
Received: from [192.168.7.29] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb4e000000b0033687f3b9b5sm1069591wrs.93.2023.12.21.02.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 02:11:08 -0800 (PST)
Message-ID: <a987f881-1c23-4528-9cb1-e5a875b7e7a8@linaro.org>
Date: Thu, 21 Dec 2023 11:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic drivers updates for v6.8
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_021113_171436_84FACE41 
X-CRM114-Status: UNSURE (   4.39  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a couple of non urgent fixes for the meson-sm drivers.

Thanks,
Neil

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.8

for you to fetch changes up to d8385d7433f9c7d718448465e30d6b8c1207b59f:

   firmware: meson-sm: unmap out_base shmem in error path (2023-11-27 09:17:51 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.8:
- meson-sm: unmap out_base shmem in error path
- meson-sm: use dev_groups attrs for sysfs entries

----------------------------------------------------------------
Evgeny Bachinin (2):
       firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
       firmware: meson-sm: unmap out_base shmem in error path

  drivers/firmware/meson/meson_sm.c | 19 ++++++++-----------
  1 file changed, 8 insertions(+), 11 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
