Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD1FF3092D
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnCe/ptqbK4poolROFP4Wjuvr0WmteSOxySGbEbMm2g=; b=M01gzmxzK/aiTV
	UVjRTDFGE7oyf5Mi8Y8dPFsM29e95PV6idXWyT2t0NhPfs83lp2RtbZ8laDonfCeH4GBgE8Ipy5a4
	vdIGWNJAdbxWC6xAmUjhWSyEXAgaLVOHaDLQy37BQRLazTHDuvqdPZg5A0V2PN4IWUW2LvFsomRQI
	pny1RogxpZ4Bon30RYVdGRtik44ijk7z6RYG/5xKy9xUUJNf8xX56MKwShH2FX6oUO7jynUGQyJcV
	P4tz3yEaV3xVrymf16bpYz8jyRDm69ao6Pcsu8a+wzVNlfymIaJXzOroxuCsA9Ecs4Pt8SgA989JU
	MHE92IDNpR9uHslwpNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X0-00000001UKN-0sJD;
	Thu, 05 Mar 2026 10:02:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Wx-00000001UIH-06YT
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62597OEf3160393
	for <linux-amlogic@lists.infradead.org>; Thu, 5 Mar 2026 10:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=; b=brmu9/RF7IkNb7vS
	GOOWrA/02uQjWusa50Vdsz0LLRigCGcb9iWdQqm4qkaE4wjH9aWdTeJQoGX8pXIF
	gWx6LSiox0Y/qsAci+Mdf0pfEhSE1ZGVd7tCWX/F04t7lWB5/o/mfuXEsavW1pqe
	wNr2rwDs3YQTcGEEYCbb+7lrMNk+7H5gzOPLRuBcjjto7wbzv9M8XZdcnZPekpfQ
	gFGwSz4oz0kGy8ZsK/RQJqRL85/JjoB8LL+6ufiEUZcEJSlMakUzDnXg8dVbq+lX
	6az8JKYOBUz+FKRyzEavLT5vMNSFnMJi6xILAaiuN1nYMi2n6aLamDcyl83ioOL3
	JHChSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v645-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 10:02:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899ebdd0b08so28997316d6.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704925; x=1773309725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=jjoGPB24ua4qavdr1b/C9J0th0ej1tyLDoCTy0lqk/Ilsdt2otFd/hEhmFAMCwA3AS
         Yv0ysOLXPpWDotpoHdSAST2KBBdjtojN05KagNJGIxX5a2zwyCbivnhnPYNyYP8CbX9L
         lPXSMgoHu+azZ/t+vTHR1bFnUXJLM+pvUzquxcpbf8G0GXhgtyg6KROntalJA+pp3VQU
         6ZhTPO+zphguTQ19oQtxGDmF1xrtOgvuKvOmMfydLZvmL46zio9MiFtzNuyjERPK6BsI
         QM/xs/l70LyWa7/+CsnpAb0Go6Up8a1LXUp2E025s9lpyhmD3oJpWVAAqQE3DTp2HHJ5
         zEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704925; x=1773309725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAYCmhfr1gUqaQ2UXxvnnkvAc0K0BTSbPSlx6GozNA0=;
        b=rJXSv3smxwAI/eeJNEcSTr87lnuiRocaWf7O3X36PGWZEcs8vj5aNN7dtmMgMz/Gg/
         O5FF5+IQsYzrngd5KhWzhntUQ9KRVd9W6/zyKR8gTJjCPLGWZ2GUGOVha6VkS3ibl31A
         fucMEuynWbIZsWZMDF0KntkhVI+LbVvH30U6nbqD6l+7DvhDxK3+jhVOdHzsgF7cfeAv
         I4Ud9Hb4hPBrrJytaSbfugvUnZhV1m1Kn6381h2gAPVPxa72y0tEQdZJpP4LkUvse1EZ
         HDMYG27mwC/JOfo/AdwT6sLPoE/Q/gM50/5TmZBhvMl3xHpINUlO04Z/vzhKUtiUJ/fR
         TUOw==
X-Forwarded-Encrypted: i=1; AJvYcCXRqumu9Plm2lUkzlkUzdvIpm8Q2EGVnmjRIOBjoSxnMdz11EVrCx3hdwzxSUQ1Vpmp4o9+1ukGJmyKfm2I@lists.infradead.org
X-Gm-Message-State: AOJu0YxHbFY4GGT6jmRTKVGcaBrPqvLvw5ROQ/pGyR7uCGA9K/PgQwX7
	sDqaAsmlvj8s4NtdR2la+mMBpRWjz5Sj+WGTDO0gYSZvt1PPKUpUYybzeA+6GRW2KF1fg8898rr
	xMatxA+khBACp1KbL4H5DCHPtoSknkZwtg3+7ggEm5EbCSPTgenSBowGD0zDW1PLyEdIaaCKjGg
	==
X-Gm-Gg: ATEYQzzoRUqPb5k1kjp9jXzySMfX+lks7sErlkg6F6qTY63XZ3MnmW+OZyjlb+Lyo8p
	0Fwb1Q+Dyet6FzX0jJgEAPD5BtBlEiSQN+F9SYKUKPQwogZUcA9x17JfGwzSmF1YmxrJXASyQXD
	95lbkfHbBd2J8OHSMNaDNoKl/mtaOFU1GAhet66opvMP8eMkPAmYCAroYWJsxeN1ruGDPIzCZhJ
	gMxMpEwVgTGfSDgiY6RLUalCZd1XSt/xQ55h1WKrUXE+mNxA4aj/qo6q176T7HSmQihOop9eT8b
	FJ16kQ3PPZ1Wf3xXZo0VmvRbyOhNzBVmc+6uyxrZkwDmA4+zsuouPTIk4bYwi1xcJKFrxfRYqLg
	9iXuIfFaXKxclgsRSLw7ctaPOmDvD10ESGfRrJbLTvJvZSuoIWHw5jcdB5To/L+36QG1SmyXKdP
	eiJGI=
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47022276d6.6.1772704925326;
        Thu, 05 Mar 2026 02:02:05 -0800 (PST)
X-Received: by 2002:a05:6214:5e08:b0:89a:ebe:1cd5 with SMTP id 6a1803df08f44-89a19d09309mr47021826d6.6.1772704924860;
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:04 -0800 (PST)
Message-ID: <24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
 <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Proofpoint-GUID: mk2Mv_9RE9uF0J0fWTpzYg67sRomqwBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX2bYWN3SbDrzo
 BllDLBYdpJhx/LInvAwttO2QPyyo/N2uG7+ReeQAUBfU3U5LvfVtrrdhdQSGkHRaqacZMgZ95KP
 0eEKDmXwc7/J6gDh6WVNbIR5f+cK3mQHzfUb0aTnAMSUktnk4DBg+YdijxjqDl6JkiDqPpmxoYl
 ayIFo1I9AHubJF95cQSkIwfE8LwWSN8EnhXiCjBotM+PoTczzwZJiiQtBtb7qm/Zs/mSIeA928M
 NbB2z5hDA6xkVvp3etB3rfVqyirNJumxzom5MPxOZNTfq1JFk9vIrA6oAPzfVZS9CDZFvNEyctz
 DL8d+IuzBHinleUCB3wt7OmJlkFhqtPjQrjzkZ/RRKrUJ+Kf88v2WyrjztQcG/Q6iRC4ZgHpDI4
 XOO3MmxYBXezxJKgLZSTtZNKzw6TsrMIOnhZ/3qhjo9U1+sqUVbkidw3ZquQUEfiUAWU3vsC64E
 vrYdUXC62UExEnwczrQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a9549d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RQncaQt55EiIgf5kr6IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: mk2Mv_9RE9uF0J0fWTpzYg67sRomqwBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_020207_186423_34C39452 
X-CRM114-Status: GOOD (  13.68  )
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

On 3/5/26 10:55 AM, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
>>> Unlike older GIC variants, the GICv3 DT bindings do not support
>>> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
>>> series drop all such masks where they are still present.
>>
>> I'm having trouble finding where that's used on pre-v3 even.. does
>> that actually get processed on the older iterations?
> 
> I had noticed the same, and had asked maz on IRC.
> His answer:
> 
>    "so far, we have never seen a GICv{1,2} system that didn't have all
> of its PPIs
>     connected to the same set of devices."

lol, that's fun!

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
