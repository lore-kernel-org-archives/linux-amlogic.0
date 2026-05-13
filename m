Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31423CD4851
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bk6pWXZ2NLM7HvNRQ+uRqHFOB7efVEbHOfgZ6Fl6gAM=; b=cfNzOQT4ZfgP3o
	bypQm2ikVuP3cd4IhQEBTzHMEOlcRPLc4LNI5VaJEvZg1njxUExVNYCny27AlbadoQYE+InSlWLMS
	080jg7IG8VVl+0MaAzmUP+mWfK99NjoPDz+xFjSe+R1zAUI/4YgsXbQQooy1Ut/drMeQSqVLvRcEe
	vdJ0gxiwA5u6oXGkKxQ4C4id97w4/CDZnNs869lQne6MKbFdBDgqtvDOMo4WnOg4cGQJ5I877mQ5Q
	GQto3qyzij5eL+Y/A/YZYwlNiYQyfEsHuWwFGoXw6rURE0fdu0xnoZgdarj0m5p1W3cRiO634pRAy
	Iilq86XyXIEu1Zs1X/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4CO-00000001bGE-2Rj5;
	Wed, 13 May 2026 07:40:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4CL-00000001bFE-3dj1
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 07:40:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so4732384f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 00:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778658003; x=1779262803; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:subject
         :content-language:from:reply-to:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+EUVRrLLFJIwYQfTJo5gatL82V7QInoa6f0bdZf/c4=;
        b=WZ5wX0kXePSLt2gMyHMUZMpl6tbD7TrH4AH//2hHhvc4nyGovTYQceIKFIXQrcDoDx
         0iQwIoCbP1J3x5bfcsRPFthV7jgoTw3GGlGmuzkQ2VZsvak3CWTku6RMjXvE840UdK+f
         6WA8ghqq7mzxnWBtvow7hV5HFKTfeWh/m61SSGr3KZNxyg0PkIMX/DsKa5eNJ1DPPAwi
         HK7CamJXApfgQGq97KtTHMKORHQnupMJ9VThy8KfN3mt6kSUkWGesC6y2ga+4hQSshn5
         Snor0NDjKYNLjiFXkJk9hGj21cQzuCTtNG+BVDM4cmBRFwRy6oNgUqcXOu62OCYTqhuD
         T9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658003; x=1779262803;
        h=content-transfer-encoding:organization:autocrypt:subject
         :content-language:from:reply-to:to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+EUVRrLLFJIwYQfTJo5gatL82V7QInoa6f0bdZf/c4=;
        b=YVoTHapwXc6OpuKFXY2mL+pjnNbJhzXJs7HI7RJrEZMxTBUFBeYRI18hoeUj/kDDEp
         fTxoq3jnC0+ckMTDMT4wSkaVO8xtEXM1V7Mhs12Q2WWiflZCbKmZ5Y071KD/AxIj3Tgv
         pw+N1zk4+zgfm0UfbO9iRuWUO8SMcs6jQwDBmNb/V7d1R8n+FLlIMNIES2Jhp8ciXvuD
         PXx/J2Ocr+qVNeXWcndPcWzISEdyIaxrDRYczCA9KsVkpkR+mXuM9CwgjfwhyqRSM0oA
         kz2DEzfdNr9qADnfSfMtV6dJcoVmAngFPjwb9CeNCChyjXtxhVPUKxIIRRumvh4sX/Ss
         K0vA==
X-Gm-Message-State: AOJu0YwC34t4OuEJO71OK9bcrboRkU0iUS6cPch3QOgp9f9jNJ3fN+S2
	9EQ/NhOBbDOiL2vvDxJKFSIs11DFXoq9iHMwmYTqQ3W+0N3a2uDmOhoQVW9U7cJS0bvLgSSACKv
	Q1YTztUs=
X-Gm-Gg: Acq92OHFHQVU+D7OjHOjlj0VF9Wfro9j/y1Uc+79RmLcQdv4Cnb6mmPLsiUyTSAQ0em
	6/iDxxe2vWDBO6+FGr5mP5E8n77e0aiHPJ/OrU4FKSw5d1BTN0AgHrly1DVJ4mAcpHHwx7NkJkD
	4G7GFes4+6/1omsbSqi/cpwbdUbrTs0YokOLh4VaTx1w4uTGzy5mu7/5U9lbXYqCINCdv6gbQE4
	hBLfwr5b5HYymuiG4LJu2leroCNpLxVqwsyd5lXdvaqFF5djvPvk89rXaXN4q2pEf7vHpf2ByED
	vomxAk2iHv7mk3yLkgb4JrPAHs4n8PtvqgV20qXu22vPg4Lo0sLS1qQi7EUxu+LoQiWKzE/EpoF
	G7pcaUE0+qEONU1YGtsiv4p0bEGPWBD7EpPNaZYljw04jRCKHpNSMOoAzjqaPk37rMps80sjf0O
	C2+vGfFD1vDnEECT6tvHtxf1gtQ//7qvRc6Ti725H51MW04/Ot0y81Qq86eYCOMvirpiuozArCJ
	+bS
X-Received: by 2002:adf:ff8e:0:b0:441:29cd:a18e with SMTP id ffacd0b85a97d-45ac33b2032mr8242995f8f.23.1778658003116;
        Wed, 13 May 2026 00:40:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45c7f2775desm3549376f8f.30.2026.05.13.00.40.02
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:40:02 -0700 (PDT)
Message-ID: <1ef9839c-caa2-4a36-bec5-84a2a1dddbe6@linaro.org>
Date: Wed, 13 May 2026 09:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-amlogic@lists.infradead.org
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Subject: [ANN] sashiko review allowed to reply
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
Organization: Linaro
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_004005_945709_8A77F476 
X-CRM114-Status: UNSURE (   5.27  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

As an experiment, I allowed the https://sashiko.dev/ review tool
to reply to the linux-amlogic messages with some review.

Note that the review performed by LLMs must be used with extreme care
since they may hallucinate or completely miss the point of the changeset.

But I think it can give us some inputs when submitting and
reviewing patches.

If somehow it becomes too noisy I'll disable it.

Thanks,
Neil

-- 
Neil Armstrong <neil.armstrong@linaro.org>
Senior Kernel Engineer - Linaro
https://linaro.org/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
