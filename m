Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A5CC6B1D
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GI/6FSSVh6XWdTz6HuMM7uRLKY9L+YjpBpM7Pmfz6M4=; b=iyIQod0gM2Lc0s
	GgAehCFGWCyEtCcqVVvhfPSLNYIlHQMqj5repn3PC0jd1ZOJOhOgBR/0XU0WO/oNvnHoosqESzZKB
	GWkShDChimyemhM8ASfmShilqc2ChZ4XRE4epNDKp1OxZqbUsFUZY/ls1u6jq6/SBqAsTAdA5kga5
	zKMCybsWe0XtWxLn3ocKb7mD97spXuJKTZNF+W2shAWfT9ThFfUd0Sp32LImIVSjeEydAarGYQw9X
	z/vy0nRHthc9/rkSPpU73DPuIoSY+xHTMpG+BEj4VJQtYTYZ01gufvGvBZoX0bv7K1OuUL+TFb+yo
	+KaPYtAfJ1EsFgp8I3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyFD-0000000FSeD-15ix;
	Wed, 14 Oct 2026 12:38:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEl-0000000FSBU-2tas
	for linux-amlogic@bombadil.infradead.org;
	Wed, 14 Oct 2026 12:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=; b=D71FhDSXStc5sXvNzQUJYD+0zY
	iXeXyP4vEQizkVBbMCAoVK/cyDox5ExDF8t0hZ6PxZchjvYhZ1fBk/iPZqNFShITm5YLVh0JeKOd7
	yx9saoinbq2nwbgtWVStgfE0+scHlmTUbZV2qh4xDD1lIaf6N0QJVdH07hs+EIG9t0m3qcvOOXaRl
	bH7z1Q/4EL1XsrVys5FDz+h5wHihIAELfqGd8kOD05Z1gw02K4WTRJVi7fYlQD77/asK4pkf4LOAS
	NFJu8JlQ56Bg+Y7qMqjUQBT5HfQjrVyRlDq/1iBL9eFCX2mxT07wPnPWR7MdEkTjpFxWBkVfQVzr1
	3zaOMPKw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEf-00000003Z0P-0EMw
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 12:37:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBPIJU3365339
	for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 12:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=; b=fBAjplYu8rnbz4pl
	jLxXGNu+kn88qr66sJRjr353pRJXQ+/rBFN+0aqlhl46LDOAWG0LbxNEkTNdR2OG
	jh1H4R5LqZMmFPyQ2rI2gGs6l1FPP8+SxjtTehM2Wn2Y52Fd9vXWF1RMrxeehR1Z
	30ev5PQXGqOXNdfEh3a7L5rEzIEnkUv6ZTLcGbCoSADextAVQauEL6bmSfgntujO
	cfc6vVng1YzOrC3BDEZie98cFbxqcQelZ2fLWqDPFBDD8Ig0I8nXi4F67OMEcwcX
	7KRryUFURIJdSyn5CN0O+P51SrtDHC6GDcQ/QuFL8EZoeWTYmWzR6+b+uPpd8xDp
	w1VGGA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621k3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 12:37:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a109c937so4205546d6.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981447; x=1792586247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=;
        b=OxJuzGc+YV7pvnvweJUbRHA53L5/fqP7A0g/7tIzJLnDz7vbi3VUe5GY8axUo3WbTM
         vapm65WJkYRYRdQzCTDEWTbkDtwdnYxC4r0Vo1eUIO4FylszWkyAP2rS1rs3LoaFZgGR
         LL3ySmImXcoJV+MpoVtfPFARrBtOk4KOymDOcqPV32WDCLxxUmMRV0fb/4kVla7Vucgt
         0Q7rSuYYQwt8SVsT7mKV3+F4GV8VaHLIIygMjuLWE60qYeraTfX3LD3/vk9YKolGIdQL
         Q5AqTzFl5SYPrQHivKtGXmToSSsU7SjuocW1D6SzfrE8UTSam5IJZt6gN5kJfCEqRl7T
         ItaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981447; x=1792586247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=;
        b=aIH5XmL5xvVDmJqsSzpuKAi5Y+67extYkqQPnSlZA+B2+1lcMxbVuyuNXc3FiWaDdV
         +oiZHW8DGsiA2Y2AV4NcwGgCfffUF3EPzqza9Vg2m3nEFkWOGDIdCXAsUoiwgbA9Eo3A
         Fa8hIZqddxEEhrpZMvl0EVxZBNRhb/lWvddYu8d5lXO4VS70IOAXOYMMFT5DQMp7lOuX
         Fzz2+CbP+wR9K3PPaLw53oL5CMHa7+K+SZ14jzTEWehpkIugvgnIK+3wsOrzXznSLYSp
         UwEC4d2cvUqGdWDHarW4ChM+aYyT/ULbROpj7zu8fSSexxb/Kh+EhVtex9WfN+bi6eNz
         360A==
X-Forwarded-Encrypted: i=1; AKwUvBwj9n2jfaf+hFWjGnxIeV1wpybBpfqU/MpzBVHmLZB02yTxTEvlpJN4ZLNJbbkXfinwv6K9C69GhvvKhegb@lists.infradead.org
X-Gm-Message-State: AFq9FYKG0LW8pmrRZEwsU1YhDLtGH7fjK6kPZ1N1w3ayYW+nVDySf9Z7
	P3fiaoEDW/RQCf6x4UHZVuN7Tklo9sZVKGG8zDz6p7+0tNWGqd6QUutTJh8VnOoESHM56iM93AC
	RGojoYXwq3G2k8L2hRM+VzSEyTu8RJxkQuXfmR7qTW0ZiQebuwJ1Pw9ZXFdQbN1QD1J2G6jR5JA
	==
X-Gm-Gg: AYBFou1cdxTIKnXSXKpRfD82w9C7OXaBpwXoOeZ0cSsdDf7FAFD3mL7JqM18w6PB6dq
	qwqRP8In7jXNDEui4zZJobJE3KA89/JW5el1KJ8iPuGddTrU2GVIiv9RKRA4B6VSTc4dnWnm3Cm
	bXjo1LHz4IKhDD0y10isGHKLRSnF+Eo2rxu3o70DWY9gpaFGEhJzwpQTJ4Ro372madK9LVs9zd5
	OpZoPMJCDFn5vHjtXTYFwwW4I6A+phhlNJsXZR3E3s8p/sfmMgXCSr2CJdSKBon/cOeyP1hd493
	kvoSUKfdinH27Zs2oQgghofX9wdZKs4zupWNtBb/40cm3uYybKDRnjYGJEDBBc1/IgjuZzhK7um
	VRM9iRaFJiD0TWSnEuAfumXiIR3eu
X-Received: by 2002:a05:620a:2985:b0:939:93a1:1383 with SMTP id af79cd13be357-93ebd2424b1mr2428521485a.32.1791981447305;
        Wed, 14 Oct 2026 05:37:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:939:93a1:1383 with SMTP id af79cd13be357-93ebd2424b1mr2428515685a.32.1791981446514;
        Wed, 14 Oct 2026 05:37:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:46 +0200
Subject: [PATCH net-next v16 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
MIME-Version: 1.0
Message-Id: <20261014-qcom-sa8255p-emac-v16-7-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6602;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5+bN3D+sOSMI+IUMfDwqXdFOaJHc/HOHr/CKTtiO7A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3ds1bIQs+DrRQ+UYZftvNuSxlqf0zl+QMIyW
 Tsd+CGnBBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93bAAKCRAFnS7L/zaE
 w2ziEACOjqFQuy0x40XxJZ/xl0i6ictP/z9z/Go10rQHDy+qpTl8SUcFwtVm8Qeg9H+66IyRoUM
 CTIK+9lLDnklaaK/X7v+vWqiuFN35N63oG+feQwfCu6epUnRbc86UWuVadyneO3VzlZc/RRhT+U
 6FJxQpcqb0QtjTeCQCHGMJj8+x+viVHyrLS2lStC4LBs014PiFN8XkG6vCOZBFW1XVTiB5kIcLj
 qI6TTqk505KpR5vhFeT3U0Ddt/bpbmZBxTKcWhUj9aGw1kwJS24Ha4UoRMMufJZhJYTyI/4q5cP
 I+V7MdCJZuKjXHoNl6G6BUo/QfTIV76quGOeM6P/z8mdA6QqpMsHnfUGLwyK00XUe7TL8xxIjRZ
 9EsKu5ggGAgC5b1erWogRHFB6Z3Jx2nQ03tNlDak//JgZU5uj4TeA1Ue0Kt55qj47gbNq8ePzFc
 m9YkpHijAPorQQ+/0tsviy7JXVlYrzIxRQm4nMR8y2ZMPup3PCn55FRJpMqN/0ZoXdq7KAWotwt
 yapYd8yGv6j8+zQ1MMLj7eSU+Z0uzcY0YHiaNRujTBFS7Wb4x3Y+JHZJCIvxWVAAI5MsIkx+1Wk
 r/GkGbq/G3dGmrCXTz/dbejgc26jAb2SdGJD+GJrbszdKXoPuwH5W+Q1JqPX50rbqs4FFKnzc05
 UzwFJ1st9Ah5JDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: U0tNpmBH8wz6YDmATpwFLBpi4GZekRtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX1pyC62OgSTF3
 IdmbIf41WzjYW8KTxe0bz/o9G0Q0JvZ/QI6HSVOJoVZwOJ9N6QcIKD17cgkcaLJUEEiHDfcWKNB
 LeyF8lBuTLgxYVLbTfwX/8AX10IVyW4anpJ3K5m/+1iN6lfkT3HGFVdF+KoRoc5TgJf99vNzjqA
 RDozyw5Eg73aF7ve8uOLciS3+fJdzqwYPKQcAU3aygtaZr2xjjyvOC1G35oD046kJygxcj8jBI7
 THLsGy8p5kwheZUF2nFAtaGLQRPNuQqZtE+Y1U6MIU7/8imWxYjFez3xZFV1IcqZuPAI/U7NFUE
 K9ibxPNJSN1IQ3Fae5be/hNz2z+xrg6yjZ4lbWwHrLCrfZqaXwbqvmJ/y9nU3xk9jbbOKGi+++U
 GKOrbA5eU4XREOAmtqXhbMv4HL7M7FcVTmbLmiIhPKDq0ZqZSkuprKuscuDKW08zlJr6lawmQR3
 103SpZwVi9OlYDtFmFg==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7788 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MNMbB-VoU2yS88OP0PEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX9hCMlJwjcOJu
 3gtuogb+F631CYmQxxhUFhPRFQZXRnkaB5CjPB/JFn8U9cs9E/4YYKBDNMnO5II6lD/Qji/KW6T
 TRdg3vkZqTobL4CoXNAwym9NqoIjBRA=
X-Proofpoint-GUID: U0tNpmBH8wz6YDmATpwFLBpi4GZekRtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_133733_348595_3C4C169D 
X-CRM114-Status: GOOD (  25.56  )
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

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 4e9c534fb240f0e08695282bb66cf6134415cc71..d59be76a20916de3febed400a64aff9763aac45d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -98,6 +98,11 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	/* Fixed PTP reference clock rate, used on SCMI platforms where
+	 * firmware does not implement the clock protocol allowing linux to
+	 * query it.
+	 */
+	unsigned long ptp_clk_rate;
 	int (*setup)(struct qcom_ethqos *ethqos,
 		     struct plat_stmmacenet_data *plat_dat);
 };
@@ -108,6 +113,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -207,6 +213,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -311,6 +319,30 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.ptp_clk_rate = 230400000,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -759,6 +791,84 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The MAC AXI/AHB clocks are owned by firmware and brought up through
+	 * the "core" and "mdio" SCMI power domains above, while the SerDes
+	 * lane is powered by the SerDes PHY's own power domain from
+	 * serdes_powerup() in stmmac_open(). The MAC wrapper itself, however
+	 * is in the kernel's register space: the wrapper bit that loops the
+	 * PHY TX clock into the MAC's clk_rx_i - needed because no recovered
+	 * RX clock exists yet - is not configured by firmware. Without it,
+	 * clk_rx_i never toggles and the DMA SW-reset polled in
+	 * dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Register clks_config to run on every subsequent runtime resume,
+	 * which stmmac performs after the power domains are on but before
+	 * serdes_powerup() and the DMA reset. This alone isn't enough for
+	 * the very first reset done from stmmac_open(), though: probe()
+	 * fakes the device into RPM_ACTIVE without invoking the resume
+	 * callback, so whether clks_config() has run by then depends on
+	 * whether the device has already gone through one real suspend/resume
+	 * cycle in the meantime. Call it here explicitly so the wrapper is
+	 * always configured before the first DMA reset regardless of that
+	 * timing.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	plat_dat->clk_ptp_rate = ethqos->data->ptp_clk_rate;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		/* The firmware-managed SerDes only supports SGMII modes. */
+		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode: %s\n",
+				     phy_modes(ethqos->phy_mode));
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -851,6 +961,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
