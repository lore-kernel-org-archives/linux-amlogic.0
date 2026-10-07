Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC93CA5FFC
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+EQE4MlpdAKtIUNgY1PhESyPSo3L5Ob3QZZL26nAXk=; b=YAxYqmbWuzTFlo
	2T8EuLPrjW3V48EZS/WI287vSWmlda7P+9Nxj3jVTvZKEu2FTtChusHMpwB6iLnQntKDC8FSsYEld
	9+dnH9BUYrme/Q6eOxh34yLny2WYjh8+VzqestVNh4dqos6GBVbnKEwXIpP7x5P5x7z49w0d1B8yf
	NDeFamFEVcxLxZCvwATCrIWwDbhtrnaeavSc72w9p7Ed60LqcWKQ5myYXzpqnYDX2jEqomEP9yHPr
	SF9JmJeYNqUrAduMeDKU0hSvqIZH9e1ZY8CPX5DF+Wg1u4zrqdlqXHEf1HbNbppICHja1cOeDn+rC
	J99Brfk75hQ+WdrpKe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESkz-00000002d0F-3FfM;
	Wed, 07 Oct 2026 14:36:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESkw-00000002czK-1ggN
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 14:36:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVBmq2802327
	for <linux-amlogic@lists.infradead.org>; Wed, 7 Oct 2026 14:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=; b=V9uBFNoIIsGfBCyr
	IFLJ5olOiamecqFnaLTts2GOhTpHEymNOai/gCB0hvfnx5X1eH3dyD3O5XSMDqX4
	rj8xP7SSbIOMMjizZBTLGREznScKUA+oY5DUvUk0Rf05jSw1fDZ6MhRC66BY4uDn
	xmWluEYrhkXsMZwDFtv6PBxoB/aEUbhGkH09CAqUdX4KRN3Q0COgzo7dq6hXvOyy
	snYta1slspHwZownxgV0I8NzS/dma/XU2bMZXNzMhJ8qm71OaRliuC8KG/sea2XO
	QpguKd69sA6YzE2r3dNiLN8QpQOLxNWCsZrA8eRvkT3DueXlEIBAfpGYyfcYiKWW
	rOjhcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge0vfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 14:36:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9123be39eeaso90730496d6.2
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791383789; x=1791988589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=;
        b=Hz3ClFWM8KZH7/hCJI0i8qB3JU9OPi4gQ4lrbIUblWKBeKclbrFrbzOsspK+W4dUg6
         NPaStl21PUnm0p542/G7cOdNeEMU5Ob3UYvcfwEv7oyN5rYTmmTHyB0lzeoAD5XLGYOG
         5mMII70nPRVuwF0z5l2I1n1y+Wm0juj9K6JyE2Mxdc6tFiSSqfgk1qkTmCEKhxdjr68P
         aGzWkmXhgv1llghL/mmxWFc16PJIxTqwOV8Xg6GcsdruMcSM/nF4qLD8eBjrC9urOgZQ
         96sFxd/RlzeOHlsBZlEvlkL9wS9dhXaN3ZqnQcP3hRgFtfVgPnKHNAEbsvcyoEkz/tbp
         UtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383789; x=1791988589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eSGGmhPnLXMyz0ttXDRLcWTAD1FLKpx4rLl3gYv1Bw=;
        b=kwKeIybCtPi1jyX0uM2EmYSlA89hsS3a9ZkfTRcW3WQAH1e9ZxTD2y1kTr0sUo/tZL
         QjIFTCIUbmy0UWxNyJjVSG0LX/yrou1iPxC/lX4RpfkN6nYsbVQ3wQqX13l+UqjGFAYX
         0o6JrG8rXhG6Y79la2pV8hEQa5iY33jYhSHC93N77bbd2I+AyHJdvJVWWbM7Jo2gyWpl
         aRKVZyzW0RGjjbu0A42KCzGLNAfNu+gfJbCYjpP/Y4Nhx4tJ8s8YhVv7JlcdHsCM9bRf
         ZKebfU42OG7w5SD8ZKuxCF//lBWs1MksjQm8BibqRqDOYFLYi2FBMPnDeIVZ+wvPZ8+y
         S+6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEUH6KeSQ3JbnI1L1KXD1uvpFFy+A+hutJf7VMaL63dzva4q8GrscFvN10nfi80eE+/2udLaY13Ow9xzlN@lists.infradead.org
X-Gm-Message-State: AFuF++n9SH5w80lSUsRiIexPy2lHgkcBmHY+Qt0qUlp0/cspjyhfHsga
	i2ExebT38F+kNWVB/3MwRFnJCGh4ghqQMW03h9eJqgxJxi+FRKTn/805hgzQtwK/mzUhqUCJfQP
	KHXa6FnhHayVovYFgKybcIV5erYPEELHx/pv4bOO3ojHcbUYQUO86tMx9pVYZ/mn4gbktDhyRUQ
	==
X-Gm-Gg: AYBFou3/rcMojgiOm2zXr9XHkLE/qpuPd4pN6RiPzpUhuGgzgu0t3u6Bq3+VMw4kNmz
	BkSDgU4HzBzXSMNz9jy6W0lFfK8KtapVnY6fVQq4+M8+yHu6Ec8u5ewmBfxU4DcrU6IdizcEhZN
	m3658iBneArJyP40WpB412byV6Sdsisn3NGmPM14aAYBsTRUHRPSLMTWptIkBkOUD2+2UUMgDth
	XWTr6tMjVceRDCN6beFdXugVuKi+e2deGNSIsaSr6848S5ACTXSuBuNQRzEEwc4YggCm1HYH5PY
	MzzrgFTDxskJWeat+yBcf8rPDuU/paNxkr5pdVKOg3FFkCVahbDETsuRxRqwmNdhvnEyW7P4zOS
	oMQwgaz14yZoyQRUmxcoEj/fJEdYj6CnMMZCdndHNoWo1
X-Received: by 2002:a05:620a:454f:b0:93e:9809:270 with SMTP id af79cd13be357-93e9b87478cmr487225185a.72.1791383788509;
        Wed, 07 Oct 2026 07:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:454f:b0:93e:9809:270 with SMTP id af79cd13be357-93e9b87478cmr487218385a.72.1791383787932;
        Wed, 07 Oct 2026 07:36:27 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm5679687f8f.8.2026.10.07.07.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 07:36:26 -0700 (PDT)
Message-ID: <5439d103-cfcf-4fa0-ae8b-32417e30ae95@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/2] Add bus clock for t7-thermal sensor
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX4Fzn7eai0mhl
 Q9ZjNmlKhG1wBTLeU4MCkAuRSc4CZIsW9qXoVnMQzow3MGNsJYAOXnJLwqgLzN8+vv4maC6kir/
 OBXx0Z+flFlNRRqi9srRKIgZiOkz+xU=
X-Proofpoint-GUID: s0Sb-xVNeeAS6x8iMb2UVXzDh6Ia7e1l
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac658ed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=z_e_Sa1Ot6aGCMGJufgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: s0Sb-xVNeeAS6x8iMb2UVXzDh6Ia7e1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX/JAQajcc3flZ
 RdLfIXRefc8z2wuoGGhfpoakjjsGS/GtXdkEh4KmUGguJOxvTD1G4xWUYWpjiWgAgfuDAxAxtOU
 4PSzpFX/nTYBrjjXPMm/XQpCEbzOPm0GhcXzeTpC8AdApOtlFRA6vMB9lNynYtKuGiH1YUPSbo+
 rOyjLOXq+mJr6RyE11ojQTOy42XfVZGr34jFsJJVGxTw83XKKWNT240oMUzLtKcEDOvpGXL8x0x
 AaIe30rb19BXkr7WyNPZpV+z3wEQgu6P3qFihRQOOFkvjR2WoRZObZ1u86y1NegQSWex9GoG2dr
 cRjtUvySPue7kQemLvvMUr+0ZEav1PPY5FZehv2g1lu9MDzkZLgfF6Kr7G6m3tAwIygoKWU0BBr
 +yvkMt/SapQFuCOxphyP6kWCxcAYZY9rskSvdmAzt/KAGjX93BnPPT7tVAzPumHj9px4aaAHH7C
 4xH/FMCPpnzOBb1e8rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_073630_563768_8D374C76 
X-CRM114-Status: GOOD (  14.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/23/26 16:37, Ronald Claveau via B4 Relay wrote:
> The t7 thermal sensor requires a bus clock, gating register access to
> the sensor, in addition to the functional clock that is already
> described and shared between sensors on other Amlogic SoCs.
> 
> This series first extends the devicetree binding to describe this
> second clock, making it mandatory only for the t7-thermal compatible
> so other SoCs are unaffected, then updates the driver to use the
> clk_bulk API instead of a single struct clk, so it can transparently
> handle however many clocks a given compatible declares.
> 
> `dt_binding_check DT_SCHEMA_FILES=amlogic,thermal.yaml` is ok
> 
>    CHKDT   ./Documentation/devicetree/bindings
> warning: python package 'yamllint' not installed, skipping
>    STYLE   ./Documentation/devicetree/bindings
>    DTEX    Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dts
>    DTC [C] Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dtb
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Applied, thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
