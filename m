Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7799CCCF2CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2026 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BW4xPUcs1779kW36YLuUjPeO5BwM2DOzAY7jGMkvpko=; b=BG8z37JRCf46+x
	nRrUlPAjpiqsnrnApWxgweOE/0dstaDDojLZEcF6CWzTtcz7YQQEI6fMqsZ+y1kYzvjBDtHa7Bg8K
	jKotahd0oGaPKATRWgehABNsUOiQvF6J65e6tJByNLtD0xcCH4VsZ8R2zc+EDvXCsUO2yqMEtmN7q
	m5nkvY4ZQmCZHwZzOy2th7xA78P2y3zAW4J90zK/uVKzVC+G+o68N6TyVKobFLp8eJipuDdNOLKhB
	3Zlz2kdx1df3cTP+gNoD9d/XA8i7c8TIZeskPYZFWkx2PJHdTlqFiE2QO48B+Zb9/c8NSs4t6coIr
	j5MWprSUzib9u9dckO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uj-00000004wlQ-0h96;
	Sat, 17 Oct 2026 16:42:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Ug-00000004wiw-0OWm
	for linux-amlogic@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGBXaC1523442
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5QXkyLgqve2yg7aR0QbgBy6
	tWTAd+S8xlmq02cu4VU=; b=lNhoZ5KmND8CPcI2ztJrmEz30rkXHlfA6ZXPZ/BF
	dIjaldaBjswQDQz152ahMBvv8elLhUYIikte8R33fvDM1XFYB4bJJwxbmkydvHs9
	eShIPCBWf8E5pwxIyBHGeuDQy6qdqbdVggs0w6DviKRSBV4mr+P3cTJTp4wdY74Z
	5KS3ymg6PgRQRKbX/+YVIu7Re+hZZAA+q5SytRzeNXF0f5SCG5w6ckx/tUicRxJW
	NwxJhIQeClRVZ0OtvWLuWHL0rqEzv6Gfy7aqB1TktkhdKtYwuruOrhAkDsgnYJJ5
	WmRvDQrRAWN6umuhYE7m35Y2hOg40tfgMs8wZ1wwrVlYWw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839bdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:42:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so1356011eec.1
        for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255369; x=1792860169; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=KHHRRs9D9rXxwuqStD72wm0lV8UbC9/+xsXoWFejfstpoY2ng3UpEUh4VTUJ6VUe5Z
         BVFqFQ1rtfv8Z1lSfwY+vwTYDVI6yf2+Sg2R+hcF+KYZ0+6fgKJpZ0oqWBzq57MiGSJ1
         cqYqakSV5AzsVKLRxZkOHPTGC9bqSNA1zFo5558/rG8jG+thrBwW9G7/skx0bop+zq/r
         Re4zS4R4wcpUkjYb8v5rrIWR4NdvhDUa+614Jvb3q017u+Nt3tSqHcHsXsk+Bilkra0t
         xEMoTBuoETFYF6Ng/RXrjxKCRYUILeBgzBifug5f46XooI/AMGekq287lDAlxtXb6tXp
         31Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255369; x=1792860169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=GW/YjmH4NhI+SwCSrN71ky2opZ5gHPBKvMe+3/Xx2yhK6N1Q9LluL5Xr4H2Ac/lazn
         BxQFoXkV/wHUruNZSbDySNbIOg9zv/1oij/+h8+S4n3WTRjlb1W05H8SX96859Qxrqtm
         JM8AK4K8KqOCY2rQi1mJadB2seM7b6q8/0/kxQv4jeLRPGMWtxxC9Ntu302/j6HlSexU
         X8IVYPsHDtYm32UxgaH826HMldBBV8PDxT0aTdasEam1SCtxVmztCQxar8GA5dqEp4RX
         IoQgsjGwQ04oehlqjFoOJHXyZMDeDkKMJK5Yf60TyfkJovddMgBt/dNg6Mrd8xW14JyI
         ahYA==
X-Forwarded-Encrypted: i=1; AKwUvBz8+qYEbonwtdYGR4OJHtStwpsJ7CutKJqWTqN4Wwlhyvn1O0f66afLv3lTNEvZjzjUSc587rxuCMhloGnS@lists.infradead.org
X-Gm-Message-State: AFq9FYKO9v9abr6CpLizQb4vbs90CNi9Lq48NEzUjXXHe53KI2MF1SxT
	IAY+hDe0aNZLHuEy16m6d2zDlIq8VG/D/TnrYMQlaB7ZL5kNnGUtG7m+oP5aomuEG5XAXU+rUIg
	3n2oYwC7NWvV9p0CK0X8DQsv+Qr69mP8THshdyXXE9rsYHVd9pZatdNNLGs+JoNX3Aw/vlLCqqA
	==
X-Gm-Gg: AYBFou0nh5qnq1RR1sakULjVnxGygPaAyygqTILAQPfDUomflTPP4m75AOmtX4bamqR
	oCVVUQqa4S6WUFLHWCjvM8mslwcOm+PcCOHHT/hGeE1JwaAG8dtmhhvm/spvcL9hRy5PKXgaVBE
	k3mjJ9YZaGkB+0M8RU377OhKeGIS/0VVgvrnSsWwQEIF52MaYc9a8B9U89QpbwSsVUxAnIeMmw8
	kG2G3eCzvOr8NyQ+VjcQ7OnSjvRmO/5QpJV3VHE3RnKan2xSKge0dB4uov2UmNwnqxjgbfcLFS4
	lClI0ZrYvsbFDL/v16NxzMCC+eX5QaSmqhkh49FmEvPi+SrnFUv3F/pWft2Ce817Q+dYU7+ba6g
	vii3Hl6sHR4Wbeg==
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689735c88.45.1792255368758;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689692c88.45.1792255368055;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm15041602c88.5.2026.10.17.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:12:32 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Message-ID: <atOleDtybJde/UE8@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX7paF7HSqDAN4
 /APf2ILWwQZ46P7SOyDBP/8va06n76sotXwbm3Whp6pmbo/6agUpTRvbn9Xfpzchg1N0j+UOyKx
 4A5gqe53xUbMzitkIU+IHeMmRApOhrw=
X-Proofpoint-GUID: K7qrQLnIR1woB9rteHufCQDzuAWRtsZd
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3a589 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XX1oeNa5M8xgm1Jp0F0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX8JucW4Kqbvlg
 tty4LLp2z9voJvr7x9IqAn9MKJ9CTB1PvoUdTPEQAX/Zq4syLRaBWQZKsxO0Rw7prwNyEUSKMcu
 QKEdHvBwRby3H1ubAM2ViTClNi0H0LDBI5sjxfw6KcWuwrjbkmsbZucI4Gu8gf/ell7DH6HD6+F
 togx3ucDV5BDjb2FbgM0m2oDU5Puk0bICkteWXaHG5CAkoiZ94RTPFKnm5Hyko9p+4Qh7ve0zBy
 wfyV7b9//6wwWp+LhF/99Peqy3NyHb+1bCPTMQfqRxGOldH3LsvEiFrtlzapR8ZGUjxLJhjCbao
 I5Rbra+EaLxgVARHHs+g4E5eTFRmC9DvDsI5FSkNGqwWlCDtg9aFdRe+ZdUR8UZYjNlimcxXuWG
 zRccZQX0xvONOmiYRd+A08TSiiDo2bcNEjkvbS0Tql+MTBNZLLWzAsL3ytSEg55kaGiDns/nMoK
 VkYVU1q/IjudzDGVdfA==
X-Proofpoint-ORIG-GUID: K7qrQLnIR1woB9rteHufCQDzuAWRtsZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094250_418434_0044C60A 
X-CRM114-Status: GOOD (  13.22  )
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

On Wed, Oct 14, 2026 at 02:36:44PM +0200, Bartosz Golaszewski wrote:
> Instead of needlessly copying the fields of ethqos_emac_driver_data into
> struct qcom_ethqos, just use the address of the former as a reference.
> It's .rodata after all. This is done in order to avoid having either two
> calls to of_device_get_match_data() or having to extend the latter with
> another field when adding support for SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

After testing it on a couple of legacy non-SCMI boards, I did not find
any issues with this patch, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
