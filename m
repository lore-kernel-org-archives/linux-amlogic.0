Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F9CD4F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsulRFW/8i7GdWKzvVAV+Qnf/geeoGRqEMfmjAydD2I=; b=vKJ4B71x5dO0Um
	zAO1NENDigT/3PcMj0b9CQwEKBuKX/YlXy7NKiWLQh28/5ArGJ2CYUWXWE+1NYc+5/wHMffwJNMeZ
	PpNJeqo1tSm+ApEkH/8vPeXrOKv9mi1g1MLXrj0xE+iVcTUcrUANl7Z+f4mDCARo2CdI/36B+lcmm
	PIfQFZKvkU7z/t2DmP3izjuqMKWEHQxVUbvxL5mFulhZJe4QPcoeDOB7S5RcA6DMu6vRYI+cCEjfr
	m6o0rCWodzYYnwFDmJ7YOwV0LEzgtLOo4WUrjtWlXPLR4XvzcDFIluxCmOCZA7k4v2PtDtMW9wEzz
	sVXFmO5DLTpaWHAxIp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1HB-0000000GM5L-0IqV;
	Mon, 18 May 2026 16:57:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1H8-0000000GM4j-0gP8
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 16:57:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAWMoF2685242
	for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 16:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oS80oywX8PrOdUvnsdr0tbCl87/qMb146EIaDFpi5Qw=; b=Lph9lkhM7RHB4WJS
	HYRdYQSyQ3AnizgjyRgzxFIQBeX/gTDJLudMB3GRZvILp9QiDVJud9WHBfnYU/1K
	VvL9POgcn//6SJj/XUYnT5RKDTylTlQE3c2hf3nGg+Ck7wnffXXSDqMmeXy9n47u
	gw4bpObSEdVqSiXh3h7rWraB8ZR5YNvP+UaAL55Y22g0A+6I156jx300itfJv/0Z
	2dklDRwyGjhdPckjE2SZiz/wIhduNHTLBg2tun+b4rJWo2tbCtGUsp8BeHqZMI2I
	mrV0TTsyOqDofyElMGj3XMz1pU/FSq/0v9+S3y3ki+wgK9gZecky9zYRFBUTK3mA
	TawYng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbttkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 16:57:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso35685411cf.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2026 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123424; x=1779728224; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oS80oywX8PrOdUvnsdr0tbCl87/qMb146EIaDFpi5Qw=;
        b=RIDGdDW3zeJELxvqJSI/5qiDEXU7PpvLlF2kRy4a3H1Z1ZX9oN6LDgOJagxRdRiZyK
         jH0Df2zCt7wz3SNc8o0dn876XnvsMN3cKs7+shLFcJ1EvZxPWHjEUdVmjL2ZrlQFKdc7
         3V+A6sS3829bWt1gJrKbyOryz2YaM44E0twByjINDMTaPJGU6Mn/lOmxWFeQ+MEUdq57
         vtoNW/f0rqThCBOMng4LiodxHhFuxHZql4VM6uGBqyXZ4E17RwGrUEFNz+1vDzUTl4C0
         exHHnmxQS4L+qjRk19BLXUA/1aR5sUmqQ8O4U8smjMkGjhp7Affj2xpqQmE0CC0yyxiJ
         6Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123424; x=1779728224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oS80oywX8PrOdUvnsdr0tbCl87/qMb146EIaDFpi5Qw=;
        b=CNF/y5anUDbyWBWQqZU5CwgYi8IXfuFrURfkIZ1VAC/6OlE3YJHbaPWPn1PXFnjaCt
         CiduIn+/gjzIjDq5fRMOezlMEJfwCQoiLN2xJxymSoRP5ywWzBPljFaImnuk0ioi2GJS
         gMmDHTCWpTQZGmZ5FdxBCGFAfAFf/lQSa0yZ3lKMKgD2XcKojGfo5yyeeH+QUDyqXhQf
         G7uIT+SvvOPxZEs1vH6X0nyRAb5Kiw0pi+4bN2y5+/pNhCr3wBGnxUaayJNV8FbtMzpT
         U3GowNLk5L48AuHjoUCmf7UetE/y1x4PhTvQbVHOVCkpAJVY0eC5MWXamJ1LQ6TMmXDk
         7Q9w==
X-Gm-Message-State: AOJu0Yxsn8TWgrEfv0CGJ9cq0JMOcQH4woJ4vqZRBRoLqycFIxXypesj
	t+lnhfqbIzgwA4XCBq5GbSMHMr1OSXj+jBIshWsBL7xLjk12KuzukQA1NL7bX2PIhD/0EcZE+He
	6vVDlo/7a+6Q+fhfbPp5gAE3w3dQsAOXzJHtkeuADFsBCgE2Yy+poOFsaaDYUVROLwX6+jKNBXA
	==
X-Gm-Gg: Acq92OGE7sHuav4WAtgEnnQ66JenMmmF6wv6isFjvDXDwV2h6CcV9dlpb9FAca8taAr
	7Hq7/xrFr043jRpGmtxn02ts9bjt8o6aq0LHTRqWczOQN+m2Tz1T6IvTxptNKrznidzYGQffrMJ
	oMg3dTeclfroIvVqMtCtV/IqrQOCh1vQkIdo2yNLDTBE2AsdsGMXaG/U7Qoj8CoAOQUGSgadgaE
	EfQznVggzFH68GJ0EMegfuwV0nhkX+FuKcxHie5DDTQZT18oN3hTV93HoOcdjbt+wacpR9N8qIX
	wC40RnOj73DE7ePGZS0JloLolOwbMh4dvLotgRJ5gNVYT27BSguGaoTFXP1beBLcJZb1F50+ihe
	NZetzS2r+1MlxeidCycHQbK+OzhWTNYF/HduaBF92c+O9Z1Oxb0NcyihTpzCkeKh4wRwWVMVyEr
	a2gjFZgUy9gRVFmJhNqKfBxYn8x4kqxpGvbew=
X-Received: by 2002:ac8:580e:0:b0:50f:b465:94ae with SMTP id d75a77b69052e-5165a1db136mr220005411cf.29.1779123423003;
        Mon, 18 May 2026 09:57:03 -0700 (PDT)
X-Received: by 2002:ac8:580e:0:b0:50f:b465:94ae with SMTP id d75a77b69052e-5165a1db136mr220004851cf.29.1779123422479;
        Mon, 18 May 2026 09:57:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c33ddb0sm3454888e87.78.2026.05.18.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:57:01 -0700 (PDT)
Date: Mon, 18 May 2026 19:56:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <c7fcmligd5jys5645spcmx2ydlh53fqllsx2cf7e4ffcqqkb3t@25ff5u7xhhpg>
References: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260514104424.04B3FC2BCB3@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260514104424.04B3FC2BCB3@smtp.kernel.org>
X-Proofpoint-GUID: onKOqsYpJh9h0XYVdJlENgyy489J54M0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfX/CthyPlxFwfl
 ZG9yM4gacAJ1P8U+myujUnub20x+A2mzsWf2gPD0aJpqPLhEa7O31YDfSip/A1mQ7ifdTFGHxmy
 pxY7rEIpkrYdS9GMUzkAukuBjKHvCfi/r8YbccXhAbOpyM/BG7+BBbRmup2spiD2GGWNbn33tsH
 iHzGGZ8BJGt7jbm8Y+ksYBhruZkcxG4jKZrkiw5LfKiaPkaUJzTLhOJoe4zL6B/dQ2dVsxAC2xT
 Ujwrh6Sh+CMkrrOvM1sbGbmLQKxF9GLl0O9IGBma6ax87hqtfDk9IHiaCMkE8kAAmMAeKk3pz2Z
 F+X0oyy9DT+d3I+2djzrBrVzuVe9eSPsgyYhtRGyyOFdWX1myIjFnNEaIvOF7y7ORWOLjzH53On
 zF0XSqdyhnoI7lPaV8ywhZ+ShG1uTh+zAlU96Qh9V1z3rlVYmCAqVti4noJ8vUSUjXaE5EoIOaj
 V8C7uVp7J3e2LRcXoKQ==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b44e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=OU9p-j7wOag53X3kEogA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: onKOqsYpJh9h0XYVdJlENgyy489J54M0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_095706_210666_BA08F695 
X-CRM114-Status: GOOD (  29.49  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2026 at 10:44:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] IRQ_HPD events are silently dropped if a status update triggers =
a reconfiguration while the HPD state remains unchanged.
> - [High] Deferred events in `dp_altmode_configured()` unconditionally rep=
ort the display as connected and leak stale `pending_irq_hpd` / `pending_hp=
d` state.
> --
> =

> commit 53d82f9a5286a8fa5530ca1be94f61940637586b
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> =

> drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
> =

> This commit extends the drm_connector_oob_hotplug_event() interface to re=
port
> DisplayPort irq events. These events are now forwarded through the alt mo=
de
> messages to the sink drivers to support multi-stream transport handling.
> =

> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typ=
ec/altmodes/displayport.c
> > index 35d9c30869900..7182a8e2e7101 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> [ ... ]
> > @@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode=
 *dp)
> >  	 */
> >  	if (dp->pending_hpd) {
> >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > -						connector_status_connected);
> > +						connector_status_connected,
> > +						dp->pending_irq_hpd ?
> > +						DRM_CONNECTOR_DP_IRQ_HPD :
> > +						DRM_CONNECTOR_NO_EXTRA_STATUS);
> =

> Are irq events silently dropped if a status update triggers a
> reconfiguration while the hotplug detect state remains unchanged?
> =

> Looking at dp_altmode_status_update(), if a status update requires
> reconfiguration, the code attempts to buffer the event:

Only if the DP isn't configured at the moment of the event.

> =

> 	if (!(con & DP_CONF_CURRENTLY(dp->data.conf))) {
> 		ret =3D dp_altmode_configure(dp, con);
> 		if (!ret) {
> 			dp->state =3D dp->plug_prime ? DP_STATE_CONFIGURE_PRIME :
> 						     DP_STATE_CONFIGURE;
> 			if (dp->hpd !=3D hpd) {
> 				dp->hpd =3D hpd;
> 				dp->pending_hpd =3D true;
> 			}
> 			if (dp->hpd && dp->pending_hpd && irq_hpd)
> 				dp->pending_irq_hpd =3D true;
> 		}
> 	}
> =

> It only sets dp->pending_hpd =3D true if the hotplug detect state has tog=
gled. If
> it remains unchanged, dp->pending_hpd stays false. This prevents
> dp->pending_irq_hpd from being set even if irq_hpd is true.

Because it's all about the pending events. If there is no HPD set, then
there is no point in processing IRQ_HPD events too (please correct me if
I'm wrong).

> =

> Could this cause DisplayPort irq events that arrive concurrently with a
> configuration change to be lost, preventing downstream multi-stream trans=
port
> topology updates and link training?
> =

> Additionally, does this deferred event unconditionally report the display=
 as
> connected and leak stale state?
> =

> If multiple status update messages arrive before configuration
> completes, dp->hpd can transition to false while dp->pending_hpd and
> dp->pending_irq_hpd remain true.
> =

> Similarly, if the alt mode is exited via CMD_EXIT_MODE while
> dp->pending_hpd is true, these pending flags are never cleared.
> =

> Will this cause the drm driver to receive a spurious connection event and
> irq when configuration completes or when the alt mode is later re-entered?
> =

> -- =

> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260513-hpd-irq-eve=
nts-v3-0-086857017f16@oss.qualcomm.com?part=3D1
> =

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- =

With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
