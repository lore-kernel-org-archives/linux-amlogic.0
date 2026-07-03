Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7126C43458
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8UOP0yDqy9KD2uNEOVjPiu5vBVri+SjGDM5C5Jg3Uc=; b=0gMr+M2V2QJj9c
	rTuAtsVZYGwP5W3Moh/WYMKY8002/l9opqxntOQJVgg0NmzS4c+/IjQrD01En1O4vbKjnNVPjblBF
	0udSNBgLM1jiD9nx0KAL6DZCMmK1oiDSsd6smpM1Nx9IJZYRpAYQ3mM5KZp+KYWXHhN1PPYfyCA2a
	lQ094mzghAhITsgc0ayWKoDS47LqiwH+RbP/MLL3Fc/bVFTj8ReQw6efbwH+HN/6QrxAKZURvwelp
	+77vPPNionZ3iBDqhmw/LvNeo6vWW5KnZsojBzY9r45oAyTlBcYMHDbPIYvkD0zdcB00UM+viDY7A
	2emEfERIppyCXqmRyQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfatg-00000006ZEw-36NP;
	Fri, 03 Jul 2026 10:13:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfate-00000006ZDg-226A
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jul 2026 10:13:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639Bn0X3694346
	for <linux-amlogic@lists.infradead.org>; Fri, 3 Jul 2026 10:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=; b=dqgTkWJ6AwlZAOOG
	TZJpLI93qT8q5TY9jfKapyiPNDC9hTYfBrkRhQfXHKwLBwG2xzEy/g1PYCJBcaUU
	CTJYs9XdM10N1GTv0P4KQnQNQoOdn5DVhLhrTSUVE03KWI9HQEgv4/Jv6jOVsiyY
	4c1b2PrtQ9oMKYL/tAlxRh6TcM94/lIi+GmwRMAsIiH5dwgA/CK3fkX5PbnZTw0b
	OBpxzzyj5fCK8w7NNtHeRjrO/9tTtK1oC9IZdWvprYULOQOdVLu0aXf5uHpMdJuv
	9iTAKxyFVHLl0aDagEWjv/nIz/7L+TqQPjLRV8ArqCu6K537da52zC9trXoYOpYy
	To389A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84873x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 10:13:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efe683bb91so1187106d6.2
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073601; x=1783678401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=QLpuevymarT06CwPwr5arE0CfsLk9QgzC2glZKViXTrw5FdWsk8fnbnfUN9vCfvR6p
         ORYMsI8SzaSmT52IvuFlwdb6nNmgjpSMhJF67kCvlhN2nifrgZHW5EyBDmhqdx07VyAu
         p+EsknJyagSxGflcB8vrORZIfJIpt7Y/TKygnlWBWgUbbC4jQ+cYke4C7CuLP5nBBQ7h
         2KlEUZZluAQcnWOawoPf/iEcKKMhLU22j8IibQkIoDayBuWMpF9NrzU18zErMDnpMBbb
         JNBPwh//wOBZsJkX/5qxr0QKpsGm94t6ezA7TqxiMKY9qVHmlyOl/gN9Ov9reT4mdK0+
         kcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073601; x=1783678401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=jKukyp3gmhVoq5WSI2/ZHaMTkXRkHaXKYV07yE4WFhR6cQg/7dj9EifN4DNuSoJ5xP
         LEtAUw9ivO2DkZKsex3iwfp3qLcixPaaF1TE3Ojia6nUNmciHSRqnpQ1GfGCyriIrR0N
         IaVlHG+/Ji89Y5GMjtVt5wl9gRLqZK4VJtqJSt5fzc9NFaKLMVSMnJAI7LNmITyg9XO9
         wp+zREVE729C76stQDuUiDD+YERrpXGhdEjUPPMk9AY2AKhuZFD8XQ9MktS6yKeD7POh
         TRouxEoFxQVBErF9ce47BxAw/eZ6XVVrt5eZpezCYbJU2tOTE0s94mhroJiIbB+Fivor
         4Vtw==
X-Forwarded-Encrypted: i=1; AHgh+RpA0tgtNuSdolrPxSdGnJ9VyncLXP1OU6sMQ4M8lzGXNWlUhEaDfP97dAZeL6htmZdkoB77YvRiourYE0FF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0YwNzzRyz64Yrp6v8JwVRAP3DuQBTw1ZJkPhI8Tu3p/vvVj9o
	EzHYiHnKKKhPYh7JqEq8KOJui1hc3fK8IQ/0vXMkO8RNcgr2EtZbypQWe2ykOQQR3HJ9q2Xmrix
	v+MHeFeAxIz1O+0YBPLlStZGTuQWCGhS8YaZhQK4OCkADPDJDmkcEYP4dtBoSLn3qnMuCFsGpbg
	==
X-Gm-Gg: AfdE7cm+aMSnJTsnTuZrp1wnOqTXxY31HDXKCb4rjQAUphpANRKxZ6VwkNCKyQCDj2l
	8D2GQP8f+jokBSJEX5J+coJ/gDOHMwE4hKvZFGw46EoayOn0NyipHGOHCQGzZwqlus7f+No9KDV
	5P8GC40WZIcmIeCaf7CjFt5s6Jz1tiDPKmo8sIP4yMnmDH88QGBz6U6LRIf4nwtkjg7VJsO6FKY
	z4MwsIrpfunOzxvxdgZDB2DsNK+WPFgc9eb8zOkqvam3U5S0QJdVASM19FQYqii3Jv3vj4f+JNs
	cdwlgu+dqcaGVZ56cKwO7R8wdX7ima9Ud8KPid/0ERQOpCo3k2RToUC8WZCG1ywkisfK1DKppdU
	aQRVXmt2uJvXtxDeIuVjmE8WV+wAuPEsVnkg=
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86121476d6.8.1783073601137;
        Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86120726d6.8.1783073600643;
        Fri, 03 Jul 2026 03:13:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad119406sm2158642a12.21.2026.07.03.03.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:13:19 -0700 (PDT)
Message-ID: <827c4b64-1881-4630-bb08-f9e2d97cd32e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman>
 <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Proofpoint-GUID: Y9ERQzmt2E7SdpFqUGvqj5PKfkZLlOD4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX0EP+Gs+yyQrL
 t84A4MFtLaSLqgNy2GyuwosRuX7zlavkE12mRkHtLCnFZH/pks/4rA0ubAcpNFpbN/XPiuWBeqJ
 WchCGX4/7GvfPXJ+HGEAqzEvkPiXIro=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a478b42 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=lwt6xitBv4dyHUtHhEkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX6O+khz0izWUe
 RGk9YYixiDhetZjjyt7c6dN6uFLG7wsYQCM+9RiCLiT2RaST8OYnaJHkAh9nbNn8rdJpSo90/04
 6H5sBrp5EBDPILJPCWe+Vdx9lGoRH7Mnizn3YW89UzfN9pSjXGpmYvT5+2QIcigzBaixKIVLO5B
 k/8C6rI4byhrV3Cjqx3VH8B17Ny9/1b2J3oe3sWqxpOEHUfQUNhQuzAOx/HW/P31eLrfYGW8sCW
 y1lK1TV0cn60KR+kcZlfFqSFNmEFpBIkYssVRVoAQxU24UYKMRwkk0n3o2OCuEHDKHmNuqXlIx/
 KBORr4kQPoBoGDRtOFJu0shbWRvA54ScT19wyMW8pB0h5NJKwuVkiI57xa8XNCnFPFRM0Ln6vBB
 Bj3kVE67cdAK8Yy7Bnux5LvPosDtZLhj5M1rmdzeQhH7rev70JYVHNGdULIBXWcOs9X8St6oMAp
 qnG+cAOIT9cVRDhrUBA==
X-Proofpoint-ORIG-GUID: Y9ERQzmt2E7SdpFqUGvqj5PKfkZLlOD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_031322_535069_AE4753F9 
X-CRM114-Status: GOOD (  17.80  )
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

On 7/2/26 11:16 AM, Geert Uytterhoeven wrote:
> Hi Bartosz,
> 
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>>> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>>>>> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>>>>> driver instead of the MAC driver where it was previously. Instead of cramming
>>>>> both HLOS and firmware handling into the same driver, I figured it makes more
>>>>> sense to have a dedicated, cleaner driver as the two share very little code (if
>>>>> any).
>>>>
>>>> I think you are mixing up DT bindings and driver implementation?
>>>
>>> Should the bindings change if we have different driver and firmware
>>> implementations? Isn't binding supposed to be agnostic of
>>> implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
> 
> DT describes hardware, not software policy.

DT describes hardware, to the extent that it's accessible by the OS

In this case, lemans-bare-metal and lemans-auto are essentially 2
separate platforms because the way we can interface with the hardware
is so vastly different

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
