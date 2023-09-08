Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E550EE7FEA
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Sep 2023 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7m/UH6lPkbVP6Xcge6bBRD4cjNg9rjifALxqdEE4Uok=; b=MQv1Hxw26HloorEDQpvuQ+t+r7
	G8uLoFbVfvK0gEQqiiNfgtnJpAqxmn7RSvvx2yyQ5S/kpel8p9oZvllF6w6BFJ4gfSrkkHjn0iRXW
	EBKK4T6zi0gAJn45QgMACdy1m4SPVT9T7URYiDwO9T7/3W5RPV+v4L1gAnOXPCnPmoCAwOKj8n1Sq
	zd/CHsLBGsk8FBHesCcXoc4mXIttbyHMFpC8jVcSMyA8mBNnSOj+dZLtxXdozkcbF7uWIau8ZItQ4
	PA/zN+EJDRexcJISk8tnieXKXZM6UeOvwfqFfPj+vjQbcRlI4NJdqewENPGY+rcGBU33fbAIvYcxW
	zWWY+ZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeao6-00DmhS-2p;
	Fri, 08 Sep 2023 12:41:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeao3-00Dmgf-1q
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Sep 2023 12:41:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401d80f4ef8so21507115e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Sep 2023 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694176910; x=1694781710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYbVbSjfXgkpf7yJkxmAIbzELrFKIsBKHyf6u4lRyms=;
        b=BoVqAjONpB7glepTq9tm/qdfLEY3t4lCW1eb7stfFWt2AgjUS12XmgPEzAWDqOqQYM
         eBXXLT4RyAZSeI9COzQDDWyRzMaMQiHRtY84eNCA5CsdEtQ0bdJHiskFH28pKlrI4CxV
         aYb1Nd7t2mNOyWw94aIQwJNcsUG/ptOXMqfd5Ro95k/GhhrS2GpwtXVA9Jk5B/0JimFr
         /16NtWN0+Da2XR50faIEZOYmJOW3LWs1FP8u/UeeNZdUCY3hFdbVVym4dOhEZMoB9tza
         +k9iKW9thahCV7rjrRAvC8Ej/b/yYJ+xTEUPlopPmcCVPD1W4aYWIH07N/PJa/0CnfOQ
         Lfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694176910; x=1694781710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SYbVbSjfXgkpf7yJkxmAIbzELrFKIsBKHyf6u4lRyms=;
        b=ChTVxUeESG4p7QVetTJB1QjBlYeSuegJsYBYuwcK7dh6vd9f3mIt50tDE1wasgxqIe
         5Lp83DWrBJOOyglCDqpZav0mF59ggmW3vt0zXuhKVRQfaqbKbp4qgGN3GO3bJ8TpSFZt
         NcQpJAEheaSYbqYSDpfYeefIRU/QQEYinlDyJLuDUrGYiLx3ATREHyqr3P9VA/Ht3Uxh
         tQO0dFloiEX2MmR2pRx7bKd7RLjVKeJZOYGdllQiV62wFez4rvYOji9Z0aSrpc5M/wFs
         y4aiOWlhBGE+r2UrDuOtF0+9GHfyVhrY5TUKDuJ3pNDohuZ6wvJ5cqiQZpQS1RLvIlYw
         hsxA==
X-Gm-Message-State: AOJu0Yz+P7wZVR1J1iLj69nFt47LIrKZty85eMsKku4lFhqwGTJmbyse
	06GuYkHRZb/YLwW6TApkQzVaTw==
X-Google-Smtp-Source: AGHT+IFcD5sRcgndbFlYk7K0tikRKDSmEAuT4GWiMUf+A87UYfKZ5sw/KGPGYEo+I7WGou7kv2q9wQ==
X-Received: by 2002:adf:efc7:0:b0:317:393f:6e6a with SMTP id i7-20020adfefc7000000b00317393f6e6amr1832671wrp.59.1694176909835;
        Fri, 08 Sep 2023 05:41:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4? ([2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d4083000000b0031c6581d55esm1988726wrp.91.2023.09.08.05.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 05:41:49 -0700 (PDT)
Message-ID: <a020e7a9-d91a-4a15-86ef-fdb05c78ae3f@linaro.org>
Date: Fri, 8 Sep 2023 14:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] drivers: meson: sm: correct meson_sm_* API retval
 handling
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, khilman@baylibre.com,
 jbrunet@baylibre.com, miles.chen@mediatek.com,
 martin.blumenstingl@googlemail.com, narmstrong@baylibre.com
Cc: kernel@sberdevices.ru, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230830140850.17130-1-avromanov@salutedevices.com>
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
In-Reply-To: <20230830140850.17130-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_054151_641809_FFDB5B03 
X-CRM114-Status: GOOD (  24.60  )
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

On 30/08/2023 16:08, Alexey Romanov wrote:
> 1. Following the ARM SMC32 calling convention, the return value
> from secure monitor is a 32-bit signed integer. This patch changes
> the type of the return value of the function meson_sm_call().
> 
> 2. Now, when meson_sm_call() returns a 32-bit signed integer, we need
> to ensure that this value is not negative. It is important to check
> that the return value is not negative in both the meson_sm_call_read()
> and meson_sm_call_write() functions.
> 
> 3. Add a comment explaining why it is necessary to check if the SMC
> return value is equal to 0 in the function meson_sm_call_read().
> It is not obvious when reading this code.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/firmware/meson/meson_sm.c       | 20 +++++++++++++-------
>   include/linux/firmware/meson/meson_sm.h |  2 +-
>   2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 798bcdb05d84..27a8cd4747f8 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -67,7 +67,7 @@ static u32 meson_sm_get_cmd(const struct meson_sm_chip *chip,
>   	return cmd->smc_id;
>   }
>   
> -static u32 __meson_sm_call(u32 cmd, u32 arg0, u32 arg1, u32 arg2,
> +static s32 __meson_sm_call(u32 cmd, u32 arg0, u32 arg1, u32 arg2,
>   			   u32 arg3, u32 arg4)
>   {
>   	struct arm_smccc_res res;
> @@ -102,9 +102,10 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
>    * Return:	0 on success, a negative value on error
>    */
>   int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
> -		  u32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> +		  s32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>   {
> -	u32 cmd, lret;
> +	u32 cmd;
> +	s32 lret;
>   
>   	if (!fw->chip)
>   		return -ENOENT;
> @@ -143,7 +144,7 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
>   		       u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>   {
> -	u32 size;
> +	s32 size;
>   	int ret;
>   
>   	if (!fw->chip)
> @@ -158,11 +159,16 @@ int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
>   	if (meson_sm_call(fw, cmd_index, &size, arg0, arg1, arg2, arg3, arg4) < 0)
>   		return -EINVAL;
>   
> -	if (size > bsize)
> +	if (size < 0 || size > bsize)
>   		return -EINVAL;
>   
>   	ret = size;
>   
> +	/* In some cases (for example GET_CHIP_ID command),
> +	 * SMC doesn't return the number of bytes read, even
> +	 * though the bytes were actually read into sm_shmem_out.
> +	 * So this check is needed.
> +	 */
>   	if (!size)
>   		size = bsize;
>   
> @@ -192,7 +198,7 @@ int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
>   			unsigned int size, unsigned int cmd_index, u32 arg0,
>   			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
>   {
> -	u32 written;
> +	s32 written;
>   
>   	if (!fw->chip)
>   		return -ENOENT;
> @@ -208,7 +214,7 @@ int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
>   	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) < 0)
>   		return -EINVAL;
>   
> -	if (!written)
> +	if (written <= 0 || written > size)
>   		return -EINVAL;
>   
>   	return written;
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 95b0da2326a9..8eaf8922ab02 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -19,7 +19,7 @@ enum {
>   struct meson_sm_firmware;
>   
>   int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
> -		  u32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
> +		  s32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
>   int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
>   			unsigned int b_size, unsigned int cmd_index, u32 arg0,
>   			u32 arg1, u32 arg2, u32 arg3, u32 arg4);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
