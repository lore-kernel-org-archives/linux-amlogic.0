Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6670CD8CB9
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TxYtG/db0ojB6onI3eDLREkD9dLSDM8vQA56ULg+UM=; b=tQ/LHysOwCvG74
	ff/31yU9r4pbo+pnzmhnaWzocNCQHplIbC3QuNxQynVOstNHO4s6AiNOaHvZTUx+Lu/lllb6kiF1l
	PfZgaKxmW++gv50qsCpjQl0uEeQKa0blU8CkrnViD+uTpgZzQtLHOTBBIo7pwspWqWF6/5pc0sKgn
	SY458wbfzHd3lUo9uAZxiMLHukYK+UugjymQSfPpCo/8J26KyG/+w92mqJif3yk7aZrJxWox2epyQ
	nlSFZ/XEu5Vzd3ng4+GR+ZouOgMTwfJHndr60jIS0oeuPUJ2W58+q3uQLO+afbAxNNYhvM5neFaUW
	rDo1aVZ09t3OKctTeqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzGX-000000062H7-2WPi;
	Tue, 09 Jun 2026 16:25:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzGV-000000062GA-00EJ
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jun 2026 16:25:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOXiY2746249
	for <linux-amlogic@lists.infradead.org>; Tue, 9 Jun 2026 16:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=; b=TAWczO2aidQaIoXM
	CC2ktMv8IynppxZsasLjjfJ52g3otyjQyn/MsteSYkqsWxvFBXVnBolc+LeiPa4g
	OZLGof7YuybsJVv8LAqENi9JSGzTdn0d+eDbOCuDOZPN0yMtyJ0S+1SEySIjJxBM
	lstghTt3DsUuQfhoaijNrGd/X5SQjQ3TgGA/wzwYX1J9zaWDoBafp3gHiyjH+Ufw
	jxmkuF3jXWwr5BMmU41FH/oHi7d0Oq5LLIYWvEDmKOisU2IWMHYd5/M0ZLjaPxcE
	lncCTIWfn2KQq0U80eAQNVczYw2UFVSmYdK1fwqdklgHGtswSh3FgTaR+d9NbjAL
	IQ3mVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wj1bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 16:25:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bcfce8a33so5151466a91.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781022322; x=1781627122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=;
        b=TJduPaT7KkwagDjY8Z++AmufCmpMsU0JGIIPziAPS49eK0oOG0AiJv+RTPkDW/9pwZ
         t5u5/X6JSkSqclx4Tu8cUpRkKPuNx7Xhoy8BVgCY4OZGzhosy6PABKD/Hp170xPkT3JZ
         Egae16psrc6m9Vln5JMRn6B9ywCgDSYivk2H12yskZRYCQTgNAw0IKVGqn+ZdoMisiMQ
         ei+d3MVrkQ6kd7j6AkC1w90sa7wif9LKa799J+mMIeJGpn6cvoOG0K3cSIW7z67YDLim
         THsG8qVLUrP0baxjb1SVFCSjIUxP6L25WiCQ1gq73Ta3uLS4+omsyP91V6uyJQOhO46F
         zDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022322; x=1781627122;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZ0RRpoiTcyO43kD7baXaPj3wcmkJLLGJPD4QWeYn7c=;
        b=D9Qio12Hr328lvusFXUn4pWlQwvDD9Lyvhe51uM+PcR+S70TtNcc7OHdS6O+hb3bf2
         otHII3hkKMPKNINtb8ZBw/mhN2oOVNgEqKM+Q6lnuuY9vanzdKUdVgABjQh4p+PZY20l
         Bv4OkpItjNQbsD538VLo/tOuuuIUffCA5h+fEKqB6oeB9o9xClbUycdda83xCHXOqOuw
         PrcX8LG7l2a4TLL+44Yq9ICfDvS7u6g2C8guCyGtNCDP16JGmlseHt/CJGAHgl/aq2QK
         rcPoqUhmN1vIHZwCO0qe5Ndvf0KTHVeCyKs5es8lvi6+wYczbCBaZZqw/jTyUROtDTas
         9wbw==
X-Forwarded-Encrypted: i=1; AFNElJ8FAyGrxvTuNpgD/YFNckjMLk6ft3E+6TrrUPZ2bWjCFJ7q9vHKJivUKbw5EWPqge9azxpy0rypD3OkdeOM@lists.infradead.org
X-Gm-Message-State: AOJu0Yziw5V8nL/SbpE4+Ui4rWqi3GsHLk2LrFdk6QKHenxY5mObvCHW
	Gmro7uppiGJhCIQEpMH/pfQx7Oji2UzF11EHyZFKmLkGi+KIp/P7QYvtHhuOinE34c/+L1cwCGv
	Xzlu5PYznQoeWZY0fVWxWVwYppSrYzTnK9bjFDpXYBL9hzu5kEGCvVdeVv7rvedlNII4Kl2R3My
	Owef+AjQ==
X-Gm-Gg: Acq92OFPSb6ml0maiV+u723G7VBdykPFSm9VZu3AmyRXJxTt0Tnx2Gct6uej7PX6yFX
	DCdu1jRWupgumqdXwuj7Mt3gSTr53YX+lit8hGSCfuFcFUKai5ean8rNLDfNBdY2wpRJ50CNlGF
	x/HLxonX3C0DnLPXSQ1H9E9ubudQ+T0K6FV7sU5AdZay8EgGYVmnssJIT5rFuzJ5gE3U+5UdTMr
	sWY55sXWw2YT1jXfsbJFn9NRrLPOBy5rNtLUA+cow4fBylfiQISOhF4KwsiUBoQ1oVZ0dDu7sLj
	0+IlySFnaMkRScI744+kwH4VxDDQdQqqMNI1Ht33HJNv4PYsX80U+5EUdeOAovMsFeROoMHL7RE
	Jq76b7kxUJP6WAEwKnO95pIgLcPEDLzI=
X-Received: by 2002:a17:90b:3903:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-371328ae3c0mr17914264a91.13.1781022321820;
        Tue, 09 Jun 2026 09:25:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3903:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-371328ae3c0mr17914221a91.13.1781022321282;
        Tue, 09 Jun 2026 09:25:21 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm24900815a91.1.2026.06.09.09.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:25:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Shuvam Pandey <shuvampandey1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <177909148011.9588.6639767953842842291@gmail.com>
References: <177909148011.9588.6639767953842842291@gmail.com>
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset()
 failure
Message-Id: <178102231651.11622.14383228802721431855.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 21:55:16 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NSBTYWx0ZWRfX77s9H5r35GGH
 b95XrMpORvfP3pet2ehnlkFgIcmawY0pjQTL2ItwYiJ6FpbOZIhInNYW0P0aCMThRSLPg34P3hp
 no2wbUmfGyG8k+XQN77ySqMA4RGnt9rdejAfMZRbnnpl2mqWJdId3LfOcIp6a9GQl5RGHx3lmyT
 IyGsRGrQTYM7UrauG8f72OgJzozEx9RxHxN+PV1VCfNmcyYy6X1qbA6nz1Z/jumJHnQ8yhTaqmE
 PTLuseudtzExDVTQ7bd7i/jO4AUzjYMPVTrdasTiWpyZdORTs9OS/zyAms1eun8UdMB9RwGRWL8
 Y2RLD48LzvFx3t1mI9NjOjqfigRoodUq96oTIgq/r2cIX3eQ4LeUERis9hq9auPtix5nx2TFQ8P
 oisY1jdoULZk7coRjX8hJ5+0wJWb8B/hwbjG1gXeVMVkTW9KXjRSHhcd1ILZRoycHTNdPnN2SDz
 Ikh0Yuc1mXOAxsTpe/Q==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a283e72 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=YIal6LhKh1zn__LXBV8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 86ozOgfQuXnRoa28clZk2ktA5syzfBOb
X-Proofpoint-ORIG-GUID: 86ozOgfQuXnRoa28clZk2ktA5syzfBOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_092523_054684_2EBC7399 
X-CRM114-Status: UNSURE (   9.63  )
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


On Mon, 18 May 2026 13:49:40 +0545, Shuvam Pandey wrote:
> meson_pcie_probe_clock() enables a clock and then registers a devres
> action to disable it during teardown. If devm_add_action_or_reset()
> fails, it runs the action immediately, disabling the clock.
> 
> The return value is currently ignored, so on that failure path
> meson_pcie_probe_clock() returns the disabled clock and probe continues.
> Return the error so the existing probe error path unwinds normally.
> 
> [...]

Applied, thanks!

[1/1] PCI: meson: Propagate devm_add_action_or_reset() failure
      commit: b12341b98d5ac52f48ca1390e1e371aed81346c8

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
