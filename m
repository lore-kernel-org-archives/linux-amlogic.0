Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EE1C27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0+1AA5GgTnbN7gsg+trEw8PwYpjeiXURj7jalpea0E=; b=HIyjaGMw18koRJ
	NXKoQmaOSgVrY4ORkTVU82LBlwH93tmn0Xb6PQkMK1BgmQtSPPW4/IT/QUCiHP7+S5LAqVvpW9tqw
	PN3FJR2J29PHl45A6BTJPtzyZikJjjDykXT2xq+/LxkQ3tJmdOjPUDrvRRQM27GSoPwkzL8N9T9dw
	hw3u3+zYZ8HZYu90KeAIIs1YBKLPc8X5sv4I0PLzpCqvnWEYiggJnYUIwpeoXTUY2Wzy5WdaxyRDU
	/grNfKWySN7mnGLl9IpvQFV+ZgpKGJkF92I4stBknmh7//fR7iFBqij1YUUW3qrpMg+0n31pw81uo
	F7d6/kMqp2jmzPsmk7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhIs-00000005gaN-2F64;
	Mon, 10 Jun 2024 15:51:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhIp-00000005gZt-2ul1;
	Mon, 10 Jun 2024 15:51:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ADjnBu028814;
	Mon, 10 Jun 2024 15:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Al2ErmL31Onn+8V/GGNbIQAKuae82QEYFcYi/9kRTq4=; b=Zc9pyATQ45fwVXdR
	wDUC/HD+uBF0uTuCBlx8ZGuPE+TPPRcdwz4NdBt/PSPrShJl4O8cGhjeZIOdc7pS
	PEE3EjUUgYuNJPEouJXIYZMD8f5q9R/3RmPBR+RRtobGQO8eDCO4b07tP7PeknOz
	jOsE3XfBTc7QWWE12HBv1flPB3Qky1BGRo/K7+DoVc+qkoUMnzZEu+RSveqbhsAn
	/z0VVojP8PPqnQLpzCdkWUhfe1jC1cQTodxNvpvULJmlT1Msw9BBQog2NZ8rwOMx
	c24WT7vIYysV0k6Smi2YcF0emQCzQByY9ye7uPChjyzCgyROmjALAio1BsEp8K4B
	4aPgUg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh34j70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 15:51:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AFpEh4031345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 15:51:14 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 08:51:13 -0700
Message-ID: <964210f1-671f-4ecc-bdb7-3cf53089c327@quicinc.com>
Date: Mon, 10 Jun 2024 08:51:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] clk: meson: c3: add c3 clock peripherals
 controller driver
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet
	<jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
References: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
 <20240522082727.3029656-6-xianwei.zhao@amlogic.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240522082727.3029656-6-xianwei.zhao@amlogic.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 03jNlSYQ9ip9hAsZZar47xByHwIFSVBS
X-Proofpoint-GUID: 03jNlSYQ9ip9hAsZZar47xByHwIFSVBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_03,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_085123_775218_4FAF03BE 
X-CRM114-Status: UNSURE (   6.57  )
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

On 5/22/2024 1:27 AM, Xianwei Zhao wrote:
> +module_platform_driver(c3_peripherals_driver);
> +MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
> +MODULE_LICENSE("GPL");

missing MODULE_DESCRIPTION()
make W=1 will produce a warning with this file


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
