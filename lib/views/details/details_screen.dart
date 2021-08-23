import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masters_india/data/constants.dart';
import 'package:masters_india/data/model/gst_entity.dart';
import 'package:masters_india/views/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.data}) : super(key: key);
  final GSTEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('GST Profile'),
      ),
      bottomNavigationBar: Button(
        title: 'Get Return Filing Status',
        onPressed: () {},
      ),
      body: Column(
        children: [
          _buildAppbarBottom(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      children: [
        ContentCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor.withOpacity(0.2),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/location.svg',
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: TextContent(
                      title: 'Principle Place of Bussiness',
                      content: data.address ?? '--',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor.withOpacity(0.2),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/bank.svg',
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextContent(
                      title: 'Additional Place of Bussiness',
                      content: data.additionalAddress ?? '--',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ContentCard(
                margin: const EdgeInsets.fromLTRB(0, 12, 8, 12),
                child: TextContent(
                  title: 'State Jurisdiction',
                  content: data.stateJurisdiction ?? '--',
                ),
              ),
            ),
            Expanded(
              child: ContentCard(
                margin: const EdgeInsets.fromLTRB(0, 12, 8, 12),
                child: TextContent(
                  title: 'Center Jurisdiction',
                  content: data.centerJurisdiction ?? '--',
                ),
              ),
            ),
            Expanded(
              child: ContentCard(
                child: TextContent(
                  title: 'Taxpayer Type',
                  content: data.txpType ?? '--',
                ),
              ),
            ),
          ],
        ),
        ContentCard(
          child: TextContent(
            title: 'Constitution of Buissines',
            content: data.constitution ?? '--',
          ),
        ),
        ContentCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextContent(
                title: 'Registration Date',
                content: data.dtReg ?? '--',
              ),
              TextContent(
                textAlign: TextAlign.right,
                title: 'Cancellation Date',
                content: data.dtCancel ?? '--',
              ),
            ],
          ),
        )
      ],
    );
  }

  AppbarBottom _buildAppbarBottom() {
    return AppbarBottom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GSTIN of the taxpayer',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            data.gstin ?? '',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          Text(
            data.tradeName ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data.status == 'active'
                        ? primaryColor
                        : Colors.redAccent,
                  ),
                ),
                Text(
                  data.status?.toUpperCase() ?? '--',
                  style: TextStyle(
                    color: data.status == 'active'
                        ? primaryColor
                        : Colors.redAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
