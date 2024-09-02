Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0739CA0ED3
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNX/ujpm3O+xHVqPdRCdckHbKq5vmXQ1co8xgHNPSZ0=; b=Rlic0ydHh8bSgosDjlD0009Q0G
	5h1bzphCHiQK5hHK4JDdUodOeQldGD64sOzEvwcAsleC3W3xRS4sPlNkIFYJmi6pUSvi8xLOBPbAa
	spe3RTJHhKoStn8EkknMVJBbZCCdT1wiXQ2TnQE0iBwckPEYU+nQhYlSLH5whL/D/4m8cOoFZdXYn
	NhKw2EM/SiCtumZxWavn2KoRnZaLmfjsxcLGHTwh8dvz2zmcSO5+8mi/4qcfXWBsyiPnCOXk5hTMs
	ZO6Ott+HH1Q5RVciwinzqd35CWph0AGJBthn7DoGLs8Ee6ysfNlQ+oRoEOjSanNQ01sp3FAmxBjUb
	2IpEz1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl59P-0000000E6P3-2wSR;
	Mon, 02 Sep 2024 11:23:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl59M-0000000E6Nf-2pfT
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 11:23:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-374c1120a32so1109318f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Sep 2024 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725276191; x=1725880991; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=waKQFxwjFd+XzD3jq2Y4F+AkwNTHxMuKGYVGHmUxWwI=;
        b=jSMQulBOt7C7Z3WDpETSffTYMeu/vaAzgQPTQB9IQuM0yk57wWXyV9NHYg5MQwrY3F
         9Q9/HOvT6WR32XJjhGqoAybWhVp2sO61dCDFhhj5TRqXQVDlnC2VUawR4LHAvwdR9VwO
         uJfj+tPReQHtNis4OoOTEb1Scs00Xv93isttz5VsecCDETmfnAVAWaqt/L9y60/KdJRm
         EPpAPNBWGq9Ckq6lSGFLu0tL9VGOt+IuksbMpey5KiMJtxC6Q5bt8SMI/wfJi4CHf65C
         3vtTBdk/+rKqBUuA9EF+9Ecx+8GCVrrMgo7LamZPg/0Hc0waIWoCb9LIq9HZWqYE6dFI
         4gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276191; x=1725880991;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=waKQFxwjFd+XzD3jq2Y4F+AkwNTHxMuKGYVGHmUxWwI=;
        b=N/qBw+FUP22IDwYdSq9ntUzkIf9bco03K4QNyW2ZeoW3OrIZ49K8VC+xTilHJmdXmi
         IxM7Xqieo+nD1ru5SXNqnfPrWWWxC78759t/ok6jW4LyznvOvRaZeYGf1nyrgurV7BCX
         lunVOvY0XONyxbgzNnLl0hrx4Xr2Z1BlUTO9zF3kI5+7eDab0aI/H+YwFBgbEk28lt/I
         hNZDUVm0BWkEObceaB6S72iEP4xm/dt6ZeVGvBcP0UjSoIozK0UpW1w7qYlWXqbDN6V1
         YcKnJC/w317yGeuXMQFO3Y5JlVQtjfPVgFs9r5EWqbCC55OtV03Ix3b8M+QXgc6qHkov
         VE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkjtCcSCgHpPfcFemy/Xu/P2GLJNYoFwea+dV18X04+PgLEoGlyZ0xvOtB8Z73ge4b0aqCUaSC9GgGUc27@lists.infradead.org
X-Gm-Message-State: AOJu0YzhJu9SE1g5Tqnvp971vzh56GCFuk4lWLBCb6CnTv9Ngoaj7lZ3
	7FHNGsW4BUy3puzSmXta09J0lSAHlcSaj1k+jn9oD97nSVcRIbl0bMk9OlN6bp8=
X-Google-Smtp-Source: AGHT+IEpDNmYXrpdpf10EomzDiJNq0Gvm63STkduz8MpJgaoCh/B3DWwulrMva9nsI/EQHJe1qmbCQ==
X-Received: by 2002:a5d:55ca:0:b0:371:8750:419e with SMTP id ffacd0b85a97d-374bcfe5ea4mr4340412f8f.47.1725276190283;
        Mon, 02 Sep 2024 04:23:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7dba:3cd0:a1f4:e3fa? ([2a01:e0a:982:cbb0:7dba:3cd0:a1f4:e3fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e2737dsm134290575e9.29.2024.09.02.04.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 04:23:09 -0700 (PDT)
Message-ID: <f526b786-e9d0-4004-a4c5-d158a0824587@linaro.org>
Date: Mon, 2 Sep 2024 13:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] Add support for Amlogic T7 reset controller
To: Philipp Zabel <p.zabel@pengutronix.de>, kelvin.zhang@amlogic.com,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
 <d00b9c940d5b6156c846b8e513adff1eba0993aa.camel@pengutronix.de>
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
Organization: Linaro
In-Reply-To: <d00b9c940d5b6156c846b8e513adff1eba0993aa.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_042312_753552_A126C8AD 
X-CRM114-Status: UNSURE (   8.03  )
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

On 02/09/2024 12:10, Philipp Zabel wrote:
> On Mo, 2024-04-22 at 19:11 +0800, Kelvin Zhang via B4 Relay wrote:
>> Add a new compatible and device node for Amlogic T7 reset controller.
>> And modify the driver accordingly.
>>
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> 
> Thank you, applied patches 1-2 to reset/next.

Thanks!

Neil

> 
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
