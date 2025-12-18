Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B076D68BE1
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Dec 2025 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z88krYK7HgUDnnhdpnJEUtZ9KZlTU8TPUcqVMQN1oKA=; b=heOAiTgbA6iPOg
	OFn1AmQitceIM/jbn90GqM537w0D03qFGSzmAJVYdDKSuBHWBKLScfFODd5IDqHlxW8GknOUQQdOn
	DeD+So3xY4sqUVtELNH6Xg6pZWaLFHnknsh+a4e2brPzdU2RtJlbms8YEh0SNCErzO+oeX36Qrk1l
	7IMjq/94AygWPpFg+naXbNj/m+ZerOBU5t1sDfjh8Mj+WE0UwCV8XLKknuq/aJXhppNNcXwCXswRm
	lozoqHeI5XbZCprJ0OYIPZpl3m7cXzNULqm1814p2lIVTKRacaUwGpGTDgtvdQT+1cPUhT6jO/b4L
	uoJJaSm2U/FP7uePEs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW79R-00000007sGf-2F8P;
	Thu, 18 Dec 2025 06:06:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW79N-00000007sFm-1iay
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Dec 2025 06:06:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YVhY4147885
	for <linux-amlogic@lists.infradead.org>; Thu, 18 Dec 2025 06:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=; b=QxCecsCm8onLOGsa
	iYRpZfZiryUV3xxJbjbOgke0QbM4opxOYcPEVwXZJV+J6iQ5c97vIfoDKSbkI1Lt
	PUXNwL64GTt59o5LufgUq6mId4uitv+4lZG3M2yFQTpMh92fOQRIpfCNhUjUwXmY
	OYYqlDwA6dz5gZ0iY/H/SIUldhAK2wEHE9UpBtxf2ml4sECXDmk//C7vfztHgOt4
	zcGfiXqtvMO2cdgttRbkzci2Fl7b3xK+RhKuNIzFU6eMiyq4SHd/3rdwilaG96FD
	HqMadCIPCzg7+MgNBYuMMymq4DWITBUljMrXgJkIT4hknAFMA8cGLyDZGTcW1HiE
	ZxiLmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u79vwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 18 Dec 2025 06:06:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2381ea85so5892195ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Dec 2025 22:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766037967; x=1766642767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=;
        b=HXlCbc0DYplXv07tuJNmEhntiBLXyteo0umB8PMSY9ichB6q/Q1novrkdZp1/UY1cG
         vKcqDHnubHBfEUKjePyjw9TWCwSdeL5/oV/SpNMeBAROyW0LzCAgHf1du9f2cEbvhE5X
         faJ7R/R1CcUQGjiKF5+sgCmkwcv5eV18KO0Czvjbz32YXac61fHT2LUHcviGz9WehWy9
         2rTxSgJeD/WEZ8wbNIMkh+jc++AxDDmXAB8/xpFqTAYVTnEbaAEwgJNo4nZUlJRc3+o+
         buvH+372osDEgNSdvuPGMlcCcLthKF8pw9WtVo+yB5KcZqln7grHeHWGJYUbsuKzcUpE
         Tsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766037967; x=1766642767;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=;
        b=SXnj+DSQ5I0AoKr29J56xEx2HqRncnI5vIvigGvsd/k9QCUiZNZ040/T3Eau3F1XbY
         oVEyx0UL0jMMkTA5MccbnnHTgoQfhf9jgi8ll7WwMViUfv9u6/uQuwo0exp9jwI3O0BS
         ordB9y26pK+DkcyeOAuvGifYOzvYao1CmlF7aRhwoYfo0nwfaXS7852QiA+c86nCB6bz
         vCREnhWH1XwuWeUq2iB+q/s92HYYdKpALz4QKO78UmN+cl8LX4HELyQBg88EAinvmuj9
         qjnINxKYxYTkLEjb18mMNur8GNXJIC9eOUAdh5yb+EQU1atAPtpGvH0K0vW2GtRhLZLz
         NnWg==
X-Forwarded-Encrypted: i=1; AJvYcCU5R2vUze7itX49XMbFxDSsCamOhxDgUVx1LKocqvDglf1BjBTDo8Fq4JOv3x2xWDPCZ0HJJfjs6AGUjCtY@lists.infradead.org
X-Gm-Message-State: AOJu0YyO8290dJSJeZ7rkfulwfyY7tIdnPi8p5YFJ9HBbv5Bjtb7m/qG
	JyJNGCrWPZQOAm0v8IclX2aCK3UpgwgF5alPIJIOJuTXoY2jxr1M65twfvw3X6b13fuhHFY+KGc
	kdNUiTQmUCaAps6oXIDojpSSD3SCY6x9/gHUGAs78qJMmCRrtgG9aXsKU/e2x9lySBURvzfTGCN
	pokr19rQ==
X-Gm-Gg: AY/fxX40Q3IORfr0eNCwuQ0J38R6Gbrx2sPS8Wr9GAOs7+4TXxPpm9MHhBKDCEGDTrc
	3I/zfCUh2ffSICUkXPB61A7YdjAvxZxpK2gTV7OIX7XeHkNkyf488KhlgcfCKvmhHC5bfVmf92Y
	uuky5ekI8nFnyNP6QrdoePxBrKMEWWg5HzWNKB5MQAD1Cu7GLGOKKSrj/AQgpA3QvGP6RtVwEu8
	enl1eDrHj7o0DtNC3SXnZdWBMpAX49zZGj4nwddnS/GHVegJaHOR10PErcv+PiCwvbxpPEmXDUx
	Mqd6I853HBeTQtLARUYN+TNz7abVT05A7Q3PHcSOLxVqzNdys8i3ynkm/OA1mEhxvFCRpmD6SML
	Ky6rMZcAEZOM=
X-Received: by 2002:a17:903:1a2b:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29f244aa9e9mr223285755ad.54.1766037966510;
        Wed, 17 Dec 2025 22:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXtU/Jq12UVhDJn8i4aPL9g1mtUoYuWCktraOpSdZBnZjjtbDml3pnPWFQ9a/qS+c2uVRDxg==
X-Received: by 2002:a17:903:1a2b:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29f244aa9e9mr223285465ad.54.1766037965984;
        Wed, 17 Dec 2025 22:06:05 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d853a9sm1307489b3a.42.2025.12.17.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:06:05 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linnaea Lavia <linnaea-von-lavia@live.com>,
        FUKAUMI Naoki <naoki@radxa.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        stable@vger.kernel.org
In-Reply-To: <20251103221930.1831376-1-helgaas@kernel.org>
References: <20251103221930.1831376-1-helgaas@kernel.org>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout,
 message, speed check
Message-Id: <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 11:36:01 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: VSYM7Wv1XBSYdKA8KsahlNcUa7LmnPt4
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=694399cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zrTfyjHbw98hyAFYeIwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VSYM7Wv1XBSYdKA8KsahlNcUa7LmnPt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA0OCBTYWx0ZWRfX4kP6NZM95zaK
 H11yN11vPG5iz0LfhgB4gteGybb7mXr9kpBnBEiLOd7eNrX4S9ugsl/kSeE1RmT4Ww/++vZw89+
 SknSnk5F3nuZMGbgxFZuvW7jj17hsmX4cta5k0WsNhjbJL48HpflJX5mSiUqR/wmuV3c2WeNRS1
 9euLvwZx1o11hCXFSboElDtvER23MhaLSF1Rz/wKxLl3AEGGQgFhQfzj/ibFu6Lr3jlWWjnfudV
 gdMtQi+LXJZjzxOkBJmpmM9vKSGDZt5BEdF9e1xB2XdXcyL6EKgGJmgckPf52fqlszqK/rnTjjB
 wFqGvzzbakYdKMk9yyc7NZbV9y3aG8OsCx829St27K/wQ6b4lNc6XrmR7xOZpUTXN7OjArjg8gD
 I/pikuHrKPUD6hzc3ghxM3eAKp6n0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_220609_454275_3ED44076 
X-CRM114-Status: UNSURE (   9.38  )
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


On Mon, 03 Nov 2025 16:19:26 -0600, Bjorn Helgaas wrote:
> Previously meson_pcie_link_up() only returned true if the link was in the
> L0 state.  This was incorrect because hardware autonomously manages
> transitions between L0, L0s, and L1 while both components on the link stay
> in D0.  Those states should all be treated as "link is active".
> 
> Returning false when the device was in L0s or L1 broke config accesses
> because dw_pcie_other_conf_map_bus() fails if the link is down, which
> caused errors like this:
> 
> [...]

Applied, thanks!

[1/1] PCI: meson: Remove meson_pcie_link_up() timeout, message, speed check
      commit: 11647fc772e977c981259a63c4a2b7e2c312ea22

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
