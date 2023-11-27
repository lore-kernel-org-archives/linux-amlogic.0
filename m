Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1A1C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2hh7XoQBukeL8M8Z8uz/iabWQ0JmbXEGZVAJ6sEsDw=; b=RVhuIe+S4dJrajF7jJ710ocnyJ
	7+KcTI46tX5YXelnIkePMrI84bcmQtDBDlhBADVSFcNCecMaiJdBWSasL2ME/ha1y3o7l6um2UKNQ
	iF7q4DszAst7rB63hqKQC/hy91SRRV7YfdfgtMlCuDllm4Ks8iZ59tXhzU8sKuFnFePs2PsRbY3xA
	gL323YTSpc/Qruk58RscR6CDPehVXiwsHQcMDqabh8zbBUy+Gr95EoZuUaoV8WB0y7YUunqvAbvbs
	dovQEOjfNoPSxtyP/4suAlmMgHRa6iYWjx4i73ezIwQccQDO7SpeoETW9bjpkevV/rT8m6lrJETsC
	rapqlaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WaH-001mJq-0E;
	Mon, 27 Nov 2023 08:03:13 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wa8-001mHz-0m
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:03:05 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c5b7764016so43225721fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701072181; x=1701676981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcPPFmhl3jLXPrx+GR4n91er0md/NE3IurXgub64qsI=;
        b=hTFqBFvqaEdzQm34Zkd598A7HAOY/TMuZskqxEObaisePjmMv5rG8IZ7/zQKYzdJ9+
         Hl26LMocc1OU7YcKRtjOX8MJl8q+jTZrwVx6S+vT/F43WzASXx8DBhP907iQaXxlq2Kn
         cZc1l/slCpIQPdAnMUVLf7QWm4pGqVuj0Ojh/f6RozYIf2il6L/FP4kFc0Gxq+gjPpcQ
         Vn0jpGSD6YC0IbBFuo4IaAxlPVt29nv1r1Dv0CWC53esJxzPqD0xSCc5wCercXr4tuF7
         owvlb9RN1Pk4mcjgL7Ie0I6LM5n8S9IV5ALUZAWzM1nbd7ozAlgYKroeqp6PYr7GQTTD
         7UIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701072181; x=1701676981;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcPPFmhl3jLXPrx+GR4n91er0md/NE3IurXgub64qsI=;
        b=KLi599zeaD7Oe3HpuQYrImDcw6fEHdUpQAEVzGbypm3s3PEJ8ZoFA/GxInwUPq/8N7
         4LqbyR1fWcexObPct6FB96K3iS67B1L6r0an/bD6g3s2lCnfbxmbmQkOMfZ6QEMaO2i5
         yJW3+jFafNzwoa6eQTXq7O9SG3gX5qlun4eqFNHaAT4Ip098mNJxHEaR4DQ47kfod2uN
         TcnZh1ip8MwpvbLuUPBVH1X3aqn06lUGnpWA7VuHlN9FWaL78kDn80ss3rvFr8vW5UbH
         3IGPgo5uwbvpvroJwozsBu53h4m/+IpR9LBJvFfuk84KM4uOjFRJt0wR0ercPRRIotJV
         bEyg==
X-Gm-Message-State: AOJu0YyLkIeItmpGCDrmO5pJ3j5Z+fzBO13Dleq4sqHgGljpB1bMMMqY
	cOGnkWlzTpDxP4s3rDr7zQaDOw==
X-Google-Smtp-Source: AGHT+IF+USKIUWRcJDJ+jO+C+fC+kGlWnuPFwuHOKDZ85Dt7rLgLUw3KjaqCg+qy1KSghN13oED0cw==
X-Received: by 2002:a05:651c:3d1:b0:2c9:a274:a511 with SMTP id f17-20020a05651c03d100b002c9a274a511mr1554431ljp.43.1701072181565;
        Mon, 27 Nov 2023 00:03:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b0040596352951sm13703473wms.5.2023.11.27.00.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:03:01 -0800 (PST)
Message-ID: <7166d20c-5092-4d7c-af0a-140854fa8e07@linaro.org>
Date: Mon, 27 Nov 2023 09:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 0/2] firmware: meson_sm: cleanup error paths inside
 probe()
Content-Language: en-US, fr
To: Evgeny Bachinin <EABachinin@salutedevices.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Miles Chen <miles.chen@mediatek.com>,
 Alexey Romanov <avromanov@salutedevices.com>
Cc: kernel@sberdevices.ru, evgen89bachinin@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231108125604.162383-1-EABachinin@salutedevices.com>
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
In-Reply-To: <20231108125604.162383-1-EABachinin@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_000304_286915_783893CD 
X-CRM114-Status: UNSURE (   6.00  )
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

On 08/11/2023 13:56, Evgeny Bachinin wrote:
> At first, patches series refactors sysfs node creation to avoid extra code
> paths. After that, the resource leak in probe error path is fixed.
> 
> Evgeny Bachinin (2):
>    firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
>    firmware: meson-sm: unmap out_base shmem in error path
> 
>   drivers/firmware/meson/meson_sm.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
