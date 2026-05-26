Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BA0CD5BB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1l/G6SxcLfW7x7ZN+WPdWwbdIePQLfbbw6esGyjbUvI=; b=n+ALzdzlofJEjV
	nX+ibXhLkSB+D5E8IzgBcDG9lLarxLyUBeJZQ+jRlnLKoVQhaciFT7kZI8AozoYuTc7eCxjbJZxzt
	/MxineARuacqQh1sLYAO29NYqwins4ysfOpw87H9S/yp8eMZefi5YgtgnOijEsgViyhVM8Y7yFaZS
	GHmXJuj9LWbVQvbmO48MMKUg+Fds+FHSaJDYS9K2O04yvh29wh7oxDRVjHfb2QrcdoPmEB2CSEFzY
	ALzZC9fFT+ZJlWqDu4xGQPUG53G8womratJIF3UD8MQFSpcK2XXQFVFhMUno6Wyc14bHG0tCw6NW6
	jWzhdWET0Jh8U/KeK9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmkr-00000001KbK-2kZw;
	Tue, 26 May 2026 08:03:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmko-00000001Ka1-10Xi
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 08:03:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q7Knqw2041057
	for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=; b=I1H5R8vagIE08hmU
	WSBnon9XuFtaQzsMobF+kemk7ZiRMYGRyhoUM+rSxAj86VOCtLLyytCaia96G0Km
	DvYa5Ghg31UYqZEqnLjbzmfmQFQAhhuRccnGq7d+2Pn94cl0NQ5mzijIc5657sKX
	h5yjoDFL3ft+fasKKp7OI96ZI5ADqBr7qpjICfqyRxWwxttxecJ3DJ5uw+rkbF+H
	EDxzl6u2vk3N5Ex21ci6g3brVmScw5pchhBiv7RZ2R3netcrBbXA5rbl4xy8HOFe
	nF/W19AH7ZQk/ELScUQRF9/mU6y4/qgx3t6g0/f2y3fHjBGjzeuRgP4s/nzc4LVu
	BMsf9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2k1p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 08:03:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516cdd89225so95518521cf.0
        for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779782588; x=1780387388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=;
        b=DhsldZ8kF5rQaL01YszUyXYeXDk63JOPyhVOblJ3s+/18M9CH3pRjTHEmUhwP2dOw0
         vVA/yWsXfjm4UmTK//4H6WTEmZj9RI9LT7+85Pag3uQUsnO1Vg51qcjYsBfBId6l2rCq
         vUUgITdFETkHmTYJwQgcCFMJO1ef9x5SzWTRK4pOUAgBUaFYvUCFKbiOvQTvs8UmofMQ
         Iw1N+4sAXit2L5cZ64pDB4h8wBd0CPzppKdegwLwQ8I1h26WlZaXw/8a/4AFL8J6diYa
         ZEip6C/3NUY8p+8QSwFE0Ot3oqqxmUUfN8zHyPcKCCVnoUkQXeWIXALmurJpQ9zavdk6
         modw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779782588; x=1780387388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYtgFOIcQTLt50ued0u3fOA2y/Gk04XYC/r9gE4EjwQ=;
        b=hpCNcatlx4ybFPvX4yl89o7AoOVkPaMCbyrnwiwvNcaRJDMTwcuLTgxS1rpcsV4478
         EDb12tAQ3V29/K9THXGyVg+djp/ARD9iNk03d8lF9wB/J0twmWQMJTPZ0nlH4oCOjSu7
         wxQNWzdAvRONy33mAZsTSJ77ykEUeexw2zrmWMYj8D3lkfq22k6i9kRYDiOzhWiN4yu0
         gmNv2b9G10cRyn1RsI91geEQZcPflj+S59OTD+GMIZmdV6ssDjOzP5slF1/EdoghLLgP
         XNmJNPaVF0JQwW28yWmI82IktLxY4r6gq5DDQAk/gaiCLXIYpO76kqLEFpc22eBrEUJy
         XQ2g==
X-Forwarded-Encrypted: i=1; AFNElJ/rfHYCkkqiMs1tD4EKUbQB74FNfUENzpOmckVxeTaIOisC9k7NEoHkQoRB4D38Pj6DEeSUohn8q5SBwzDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyikxzJf936qZV9g6/kmr3cCmjs0zh1V/rNOs52h0a7/SWb5m6d
	wmqSz9ujnJq6MfJUVNPFDYhLEf4QVpa4asmg93xneOqErAZ9ERTbc2svfS55yxgkZqR9MzySTCh
	QiXBO3iywjjdoa8x2BNkgP/hmMjv3yqN4b/tYsEo473S8U5rFXiplxN9XgI5FxQjczMl/mt31/Q
	==
X-Gm-Gg: Acq92OGOggR0rNdru3YVJD46vaQpJuIkJeUPgmnmFFCM1HUe+xwD1E1DUectXwODDY0
	5/PBY9MbRuqDAHZ5tYWBppHFRNXOKKTkQsWUVJMJ6lkTF1e9eOI3L4CUoD733xHhhQLnM7tP21N
	WXVrznVmZk4A+oTTo/C4ue9pZOX9KXgo5N4Rr/Ygngig4YGZF0arb44SAOyQn0ZLUNZ6c2yOpBP
	5nRMPWQnTGJfDe+IQPCRasdqoE8G8NFSq35uanvp5Xhw6midzalWnsupwZp+fJPo9FvlpzMAVpO
	rbNsfDn2El5ihbI9Zx8KUgl5DItS7KH+iTe84sSoZRKZSfnYvD1w+urj6cD1OPC88+weVjKSIYl
	QAhaEfYwf9irlK2SDEqn22hrkjCpIDZeAn4UIq3vrsOT0jNkA1Q==
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr251537781cf.13.1779782588347;
        Tue, 26 May 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:ac8:5ac1:0:b0:516:4f3f:d742 with SMTP id d75a77b69052e-516d440343cmr251537301cf.13.1779782587900;
        Tue, 26 May 2026 01:03:07 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm176729165e9.0.2026.05.26.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:03:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jun Yan <jerrysteve1101@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Tue, 26 May 2026 10:03:05 +0200
Message-ID: <177978258287.4574.1235390656102820525.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524154954.385778-1-jerrysteve1101@gmail.com>
References: <20260524154954.385778-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-Proofpoint-GUID: FYQ4S2coysD6IV3fSYmt-mKm7wcVEALF
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a1553bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XSeIg-1IB2E2TqoohwUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FYQ4S2coysD6IV3fSYmt-mKm7wcVEALF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2OSBTYWx0ZWRfX+CALl+vJbKEr
 tDyFpTVlRZFvuWNT+vSxOL9eBA3Uujx4GZM2tKVKSTnfpKqeSEUIyu4xPys+GXGNtCQf18uVouq
 Iy/Mm2K0MRKQA9dRqgKpPI1Sxp8asU69nZp7euWvjSKRvDV6ODi5dI6Xfdtpn3GhnYRua84e0vq
 KlJFxHXzra5AnkcnVHtltVVZEPF586HLQoUb4mfoBtDdD/JNNcRONGcfyPSdm3e16E4f+IN8GlL
 bDu5ViTFiDGRStUG41Stg8EtNsO9QWkAgR9kVLZCRUvLxvxzpKnDxFY92IoTlVrujnSGFWspjIt
 vj2Sf3bT00NHPSxcNf7fXfXQv4FxNSliQc5928Lh9XMVjxRtG0tRZQ022mbCXj7OIjK12ygsnVx
 1HaPaJJIv3vKqYdapJc6te2WHqS1UMXzxvl6HDfAsShCjiNOScOz0bCEXqmhFh7HnQyGBHQLiFH
 CyVgZWl9/OFteg54szQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_010310_281177_71E60328 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun, 24 May 2026 23:49:53 +0800, Jun Yan wrote:
> Clean up whitespace misalignment in meson-axg-gpio.h
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: meson-axg: Fix whitespace issue
      https://git.kernel.org/brgl/c/820017813b818a9b6411e481fcc98f5260b6e6c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
