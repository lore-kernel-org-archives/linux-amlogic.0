Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4A3CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d+jLHDZST8t/d4JWsdZPCrLIzt+FXV9bqS4YOTOkdw=; b=IEgMCqjQS3tQ9T
	6BFhBfuyt4k6ghNxt+AMK2xKKbAjdS9u8VkQZImJ8VKiAeSvrKtBhPU2a9ldXZUOhpbOEZd35/F5n
	41havlj/3U+UCugzvh3fSDCTsVz5FSdH6rfSophdxZK5z1duEfLloNUkJOEeyktiplcyTg3P9iSeW
	O2wDtwt5dnQhpKW7O8jfhsF1CdzRFriKF+2oTdYc6+alUkVl7GlSbabnzY+sbB1i9vcd9+tpuOXCd
	nCQ0S8rH+X/hQVarm9PEH4LFPVbUzeA6NN60wzePkUiDO5MvVSZOZSPV2wcKXwtlkldClwNTH6jXr
	hlwDjp1FhPJWP7cPAiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1xp-0000000G0J0-2e3C;
	Wed, 14 Oct 2026 16:36:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1xi-0000000G0Gj-1J9v
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 16:36:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbHLP467704
	for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 16:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=; b=NTMjNEvYqdTCrKll
	f6XgOd60FLUu0XdMAj4D7IwL++ZnvVk0xw3E9JzHsXJ5cLwEOOQq3ip4lcEj3Qsz
	FQjLfPpM9zxfgv3zGMEYeSPgpIfndEwxOrtxSneycTU/s2FeHk06HmPPMYTlx3Ma
	VorPWR5d7vtllaxOSeBTeEsBifuxva5XOLjtdg/zpLiQ7g7soCORo+i8zsJMNwgG
	YxXHxU7XBSeSJsREwCIvF6zEhvS6aRW9IHeaoxldVxCCf5PaiaNXBVxwvpYdbwWi
	wKzzxsCyVjL0f6aT2QyitUg1BKR992QBb+EQK4OC9L9HmcVsqp7eFdoRNUTkUea2
	QRN/qA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphkhnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 16:36:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so9547111cf.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 09:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995776; x=1792600576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=;
        b=Ya93WMY4wWP5wL4V9e8ARNub73R4beCMGmrW0OM2V2z+1RXwbYJ3Olp/sCk/5lTb95
         /+MkU3CPnwYYKujixhUrn/ad05wq+kr+1QnVfoedewVMeIxdc1UXEPed9j3eEizIAACz
         fOeqEZ+b6wtAjSmOuLvVqlr+hl9Py2Tn6rWlbFpuv6B56oB9nFDqhnvY7zu+XRwWb6pM
         pBIhGSSZ62eonTx7Qrb9UG7swcLEe5uQ+Z4bpvERIFN2CMPFu6pvvgItC086TfEoPyPC
         0sE8Zat9vgiyl3sePw+6g13S2Noi/3VimWhuDA6MsJ2RXzMtBDmftlh9Ui3QC4fcsnhY
         I4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995776; x=1792600576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=;
        b=W3K0cnzedksgj+/o6BIG+IMSmSAgh3iRVJQ4Mxg8e1dcL9+/3vHcgqSl/QcpYbY3dK
         OaSRgFArRJ9MzIDeG+ZiT3Ryuz5FkUrdTMNycExizZi6UxoMI0NLiUOAkHzmpleS0HQT
         t0u09i7dWQhwVT4ZpNJZFH7U+asDbBAVdmttILGICGDyEqiFil8SvOW6KSUHxeWp+60H
         auE7Tg/n87xT5cF16cOnFsFIkA6FZqVfI2k9eT/Dej784J5Zdp/o0onIA293x2q3WN/f
         Pg4tIW1SE3e4SQ9InMVPQe/Da3TWuWPtj9q3Tvq8mR7mUxYQ9L50kkriDsTcCpYS5PPc
         OVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBynYVOrMOWq5m6ue1GvI9nZzMsFLFdQWdhfYS3rlsbeFblXQRwImGEk32drMW9QercxIFi6En5tQGZQLRKy@lists.infradead.org
X-Gm-Message-State: AFq9FYJrKCl8z0H81IqbgzNZjqsNrc2G2sI5MOop5rRkkghyt/lKg0pi
	7BokGDXN0Y3VQ0XamQMa45XG4fpC5CJAyGsoCi+NV+iOdsxIQHTG232RDclgJnyE6TPUGgjUApv
	nfP9Sb+zUXkTmNDME3TiqSXJ8k0VfCvPv5uRqlnQyoAzaTLj86j5DApRWU7DKlSBMJ1Ww7wjeQA
	==
X-Gm-Gg: AYBFou0BGY9BPQdKMzLLpXD2LMbc9VncwZYTCo9314HFoA7OqIdwvFK7Eln0fPaHVJk
	N7Fbom4Y7fmVDzWHgLzRHeWVL1DP9hZrcMvMYuJkKl75arGqH2bvjCoUhlI3m/Fmx7OOX7+5NhB
	7jVLxdA5EXzRXFzwktUmG67mliXq0j72ccucjK46gmCIL6IpHdJ0fa37L55eAGb7xfv0n987QPA
	rQfNqCcloI1+h4u/LdrggVi8FhfmpMW2hBL3TYGz/Hqw1tLRJU0wauvJ0O9aj0u3mn15lTZZUlB
	AhWRh7Jl7H5NRabqAjVfKec7/T6Da841RWCiYdE83j5rgCH7Lmn8jAbJpGgGN8s0I39/6P8WfcS
	k/G4e8lxBqD3Nq+O5KSywwQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3128574385a.2.1791995776320;
        Wed, 14 Oct 2026 09:36:16 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3128568885a.2.1791995775873;
        Wed, 14 Oct 2026 09:36:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20386327csm1289977a12.18.2026.10.14.09.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:36:14 -0700 (PDT)
Message-ID: <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
X-Proofpoint-GUID: _kRM18ShydaHqL5EnsD4PIKQO5ZCVXiZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXzdEK7elew0Cq
 evd1JbYZeL3gJkEc0ulJ3B6lWnoi+xs/EPNsEKwXohuiQ7sBKU0tBsl5+yVC47en02K4clczXEd
 es9fBMmNZSwY1vuowi9TLFCyXOk/hu8=
X-Proofpoint-ORIG-GUID: _kRM18ShydaHqL5EnsD4PIKQO5ZCVXiZ
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acfaf81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=auHUQpDKApYGa_LtnhgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX5czEZca43m53
 +O6KcDyHVNPdwgI7eH73Qm1bzoWhB1lge1MHZR+bzlCdT3Sp1VbCbAPBvwzP1ndHfdmNpHeHErp
 yfGUECG2AgUx+OLjNkL/IcYU3c0MjK5/wlLEQo59m2mdt0H9aJJWWGEm1cluhV7p5F4oXjZBDL3
 CizLZNvwmkAI5CQDtq0dnoi+CuZwiCXla1f3qiHtcCEoEHtmeTm7w3AmU8Eq+OwoqSus0EhLjJR
 gY6qjAyBQ5FKBQg51dgWdnFuyeoQID/mopZWz+lVk54Ax9xBE38bwkUZztPZhCYcrevpKQJHV27
 TRbVgz9djWuLJN7H9B00npHQZaO7J2SgZJuv3DS5u2rR8SGsHxm0DPEQc3NLXwVvXMtXFakwCsI
 9fiifoNl5ZHJ5l6/CTCQBzCjDoqxVJ+xxUOrZ0wVkjdsGjGRwcXuoliNBdvZSklRofpBBSDln8h
 3I2fLTUYtlh+ZcZzcsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_093618_462365_9DBFCBBF 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTAvMTQvMjYgMTE6NDQgQU0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9uIDEwLzE0LzI2
IDExOjI5LCBDaGVuLVl1IFRzYWkgd3JvdGU6Cj4+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDU6
MjjigK9QTSBOZWlsIEFybXN0cm9uZwo+PiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4+Pgo+Pj4gT24gMTAvMTQvMjYgMTA6MjAsIENoZW4tWXUgVHNhaSB3cm90ZToKPj4+PiBU
aGUgRFdDMyBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3QgbW9kZS4gSXQgZG9lcyBzbyB3
aXRoIGEgWEhDSQo+Pj4+IGNvbXBsaWFudCBob3N0IGNvbnRyb2xsZXIuIFRoZSBYSENJIGhhcyB0
d28gZG93bnN0cmVhbSBwb3J0cywgb25lIGZvcgo+Pj4+IEhTIGFuZCBvbmUgZm9yIFNTLiBVU0Ig
ZG93bnN0cmVhbSBwb3J0cyBzdGFydCBmcm9tIDEsIG5vdCAwLgoKWy4uLl0KCgo+PiBJTUhPIGhh
dmluZyBjb25zaXN0ZW50IG51bWJlcmluZyBhY3Jvc3MgY29udHJvbGxlciB0eXBlcyB3b3VsZCBi
ZQo+PiBiZXR0ZXIuIFRoaXMgYXZvaWRzIG1ha2luZyB0aGUgVVNCIGNvcmUgYW5kIGh1YiBjb2Rl
IGRlYWwgd2l0aCBtb3JlCj4+IGV4Y2VwdGlvbnMsIGFuZCBhbHNvIGVhc2llciB0byB1bmRlcnN0
YW5kIGFuZCB3cml0ZSBkZXZpY2UgdHJlZXMuCj4gCj4gSSB3YXMgaW4gdGhlIGltcHJlc3Npb24g
dGhlIHBvcnQgbnVtYmVyIG5vdCBuZWNlc3NhcmlseSByZWZsZWN0cwo+IGFuIGFjdHVhbCBwaHlz
aWNhbCBudW1iZXJpbmcsIGFuZCBjYW4gYmUgYSBsb2dpY2FsIG51bWJlciB3ZSB3b3VsZAo+IHRo
ZW4gbWFwIGluIHRoZSBrZXJuZWwuCj4gCj4gSSBkb24ndCBzZWUgYW55IGlzc3VlIGhlcmUgaGF2
aW5nIGJhc2UgMCBmb3IgdGhlIGJpbmRpbmdzIGFuZCB0aGVuCj4gY29udmVydGluZyBpdCB0byBi
YXNlIDEgZm9yIHRoZSBYSENJIHBvcnQgbnVtYmVyaW5nLgoKSSB0aG91Z2h0IGJhc2UxIGNvbWVz
IGZyb20gdGhlIFVTQiBzcGVjIGFuZCBub3QganVzdCBYSENJPwoKS29ucmFkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
