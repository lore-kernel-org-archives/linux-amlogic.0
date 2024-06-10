Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A1C27C5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhnLLA6M0CZjJQPKbur8T7hmbql8LfkC2IVhrPm9+wc=; b=R57xHyIMLbXSj5
	XwURcGTjTk5WT2jRQndAv5xlridPyk4R4qLOXl6NfIizf1Aoj4c9c+8TPmFEgVseZQw0WxIGT9kOd
	ILMD5Nd/BEXi5ekPRc8IGs2JHhsXOGg6MBX+c+fYwJgaNMEknzN+LHyTN9RVkdygN4TXBvpbEfMcW
	DmrdeuXkKjUICQXpLsZJoHmhXakCUGVru3+bAI/sc55t/bXl0KSVsRkdw3koNeGyCzbVgck0VnNVD
	8usitE7LXrHS9wlRA5HyPpjHRbX3sxs/I9F1teX2rtReMzlXls1b+r93JiiA5ZEjMo72p7wDRzhwk
	3T2sulL7yTtTrtUwkFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhFP-00000005g8F-2vTD;
	Mon, 10 Jun 2024 15:47:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhFJ-00000005g72-2Ldw;
	Mon, 10 Jun 2024 15:47:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AF0FOx028937;
	Mon, 10 Jun 2024 15:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6rTfujD1woPMOWzNzRUyk8OfduEpNUC3GdWLs22kUoc=; b=FkEKWHqyUMp61Y+N
	MRTKNb6aXfHQTiEKCqvDt6Md4gs6U4XWYVhtB7W5CiCxVz9lBujisS/2YIyqRb+M
	3PUqyiu+3oORP8oSScmXU/gZm082fIlSv3QvRwmQth64Ka7nNBUaASk5xjS0RhFd
	LR4uUGeQWSjCnPphUZ+Y/Mi5a3Mn1HjmH9aiQ8n4Pb/0sCTxr+I4dHZaGJXRnuHX
	osVpwefgxJ0z5AZt4nuWSpe8sVJmmzqC3eSlMjEvYQS4dWDm5pDoGbdsJUkZ/Kg5
	qJy3LVQJjBJz+ucPPHzXTaFESnCUB7tjvqc1yE/9cBo0tWDq8AzsaxkZcclGJCuF
	y0ebZw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp7bsra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 15:47:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AFlXQ2021339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 15:47:33 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 08:47:32 -0700
Message-ID: <fc62a3bb-4079-4bc6-ac57-2ae2eed68ae2@quicinc.com>
Date: Mon, 10 Jun 2024 08:47:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] clk: meson: c3: add support for the C3 SoC PLL
 clock
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
 <20240522082727.3029656-5-xianwei.zhao@amlogic.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240522082727.3029656-5-xianwei.zhao@amlogic.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3LAG-p6qLkHcjpWLgpMCATE3coLhT7cH
X-Proofpoint-ORIG-GUID: 3LAG-p6qLkHcjpWLgpMCATE3coLhT7cH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=986 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_084745_804802_71E3232E 
X-CRM114-Status: UNSURE (   7.31  )
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
...
> +module_platform_driver(c3_pll_driver);
> +MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
> +MODULE_LICENSE("GPL");

missing MODULE_DESCRIPTION()
make W=1 will produce a warning with this file

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
