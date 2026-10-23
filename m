Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F95606A31B
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 07:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n6Q7gBGG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dmvpcZ6z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i9keQEK1wQcp1pLOhGgc2fX6FRcnX95FvRU6vLwGdEQ=; b=n6Q7gBGG805Ldu3Kq88Wgvmb9m
	vjwkxZhN5Lg0PfajFQcInbkFc02k6miNDGbXAOVTBr/9UdMEeI+G2mLf4muMNzbmXmmjggIXCr3IT
	XIzbzLJ9aQ+c/uNT4tGfZ9pCZ2EIzEAYhY/cgmZJntcEMEOHVBEGN8rOKNls15j1NAegZLHOKQ3xN
	9FZPuH+3B7t17L0Vqzt2wTd+23jrSwctCXpbg2oGSbsNHzLhX6JKe+Q/nUfSPP5RMNiMgovb7d10M
	I/7j5v2f/AYea0LJtx53qxSljoUnQFGoqTJezX5618QBWmYcZO4FB/ip9kxnMosZrh7aKhltBatmT
	bb5r8ZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9ck-0000000FkB2-3lFS;
	Fri, 23 Oct 2026 07:23:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9ci-0000000Fk9i-2BYB
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 07:23:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b042c0759so341559f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792740210; x=1793345010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=dmvpcZ6zpbtpFd09DTL67OaoFtGL8oTYUc/4hAhMesJMUywrpG+lrtubVDBRyfpRl3
         vJZHIi+uwP9TDq3AgSfcOv1A3iRhBImKlCUt524Q2hJzRMbzUfM7cH/F3B0dETn59h39
         3LKNBmdGcK4CMq7o03ghRosiogQnXWXdo4KrIpCtiF+DQCefxVZql3TmxPlXYeH8NdAK
         LQ8z6i/YwoFvGmGVOpkQ4khlga1UwMv5SjHHLdU9AWZQMSUL7Kid0j1sR3+AaDetDMI1
         Rsk5H+XgfsKhcQjimpFuDJ530v/SlIRq7QagQrdlpPodI7DSfPgwjpizRL64SBHfRM2y
         /VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740210; x=1793345010;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=TY7+rRa2i1J+At98ldUXIDna1GsUA66IouD5Ubgu67Qyyd1RfuFtQEOz1A8UfdHa7m
         6fmRoqWANaJs6SOaqUE9mze0+QAiQj81DsD1legCm1Qmo7TFJOHkhOzTehIeqw2Nfxwq
         /NrWVWXMdb7DYHFE2hLC/jgnv7TacvuhrMXp73/ghVn3+yvlPD5igGS6pChtzAE69Qr3
         fXDsbpn29CqFP58+IIpfD8LbJLBkKbmXs4GeEruEJGg+2P6ouWwsOYMBvd5KJJfAlGuv
         Mxk/R8oVpsUuOP8ns/LeNZBIxnXSbSpDp/awIlIEU96PpqJvITdDSBYOtMXOiKM7qMPT
         l/jg==
X-Forwarded-Encrypted: i=1; AKwUvBywQ88dZ03s5DwGehhq97YkN1PDUcE5zhOt4aNZ8C8kZewGM96f5ASl/nv75dhmm4ZGJ/ixJMmDvu86CO9C@lists.infradead.org
X-Gm-Message-State: AFq9FYKYmXn8EuCx0ryRDo5H9gXo/DU00/jLXtXPDpc/x6eBHH09aMKY
	ywQXphrGFW6WlQTIZ5DKHJrBookb3RUlwmGH2npJl41UFJJrJqf/4z4UGr5ihEn3/Kg=
X-Gm-Gg: AYBFou1PBwQsSPubuMP7O6P+J9LuGEPIxQYWDB9wwTvVzP3x4uzLO+tkIZxMPVdq80e
	qaT3aY27qM0S65z+r5eaqrQ6DTBxX6+OTmQrpOa85Xd2t67ASJa1zJf5fPJyOsqYNZ+95AGkf6s
	6hshMuxm2Vrv+MR8tZovjVT3b/XGePhGCzVmIMDiZui+i1eiH/QD4Ld6wB2mErYgjUqiNY8lCdL
	c6fBvIbfHjzIvZ1cCC/5/5RwdmlUMFVbUJcoUineYXgaRnQlX5Dzs+wmPa5R9OUZ+B/opixvBmB
	z9C7aJJ67ZsUhuaZAVNOr4NMv8IvwS0e4X3y/qnHdyVuZNdB8sy9KefmoG19sakaE2ZHgcAeWTq
	dqsWMorZEd0OzH7nshzucXaWCwluO03/vXTN5SO1Tz4Y/e+Z7ruDGOh/zb9MSp3FMWLkS1Af+Qc
	FpSxmBJ3G5sGCF+wspfKgrEy2/43GJQ0bl5k9h07UjDnlXpTIMI8SKQ0uiXNIJoJSSFGtBbCf1d
	iPrYbFlTMCXb121g/tWM853/l7yOxxh6/ZRxDu5kUgDsL23PZn3la/htev3yHxpdPP8p31f0E+m
	ZoZUhKnarbAtKjJdpmwnRW6+cPOHFcuGRpI=
X-Received: by 2002:a05:6000:40d9:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e3858b5f3mr1960195f8f.13.1792740210407;
        Fri, 23 Oct 2026 00:23:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:1c53:498d:36f3:7085? ([2a01:cb1c:fcf:4600:1c53:498d:36f3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm3456370f8f.6.2026.10.23.00.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:23:29 -0700 (PDT)
Message-ID: <3bf32179-dd0d-411c-af37-54d50eb7986e@linaro.org>
Date: Fri, 23 Oct 2026 09:23:28 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7
 and S7D
To: Carlo Caione <ccaione@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
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
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_002332_610126_8E948101 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 20:30, Carlo Caione wrote:
> The S7 and S7D device trees describe only the first 256 bytes of the
> GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
> interface control (GICH) and virtual CPU interface (GICV) regions.
> 
> With the short CPU interface, the GIC driver disables the split priority
> drop and deactivation mode and warns at boot (patches 1 and 2). Without
> GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
> needs the split mode for that too, so KVM gets its in-kernel vGIC only
> with the whole series.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> Carlo Caione (4):
>        arm64: dts: amlogic: s7: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7: describe the GIC virtualization regions
>        arm64: dts: amlogic: s7d: describe the GIC virtualization regions
> 
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: 8610d31587e139380db9cb8708f4263833b482d0
> change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
> 
> Best regards,
> --
> Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
